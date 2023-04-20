rem
rem Really Cheap Vacations create table with constraints solution
rem This solution uses a mix of create table and alter table commands
rem to create the database as an example. In general it would be typical
rem to create the database only using create table commands.
rem Author: Dave Leskiw
rem Updated: Mar 29, 2022
rem
-- To rerun script multiple times, the script starts by dropping the tables

spool c:/cprg250s/rcvbuildtable.txt

DROP TABLE rcv_tour_destination cascade constraints;
DROP TABLE rcv_tour_customer cascade constraints;
DROP TABLE rcv_agent_training cascade constraints;
DROP TABLE rcv_destination cascade constraints;
DROP TABLE rcv_vacation_tour cascade constraints;
DROP TABLE rcv_rating cascade constraints;
DROP TABLE rcv_training cascade constraints;
DROP TABLE rcv_customer cascade constraints;
DROP TABLE rcv_agent cascade constraints;

-- Create the tables and constraints.
-- Note:  Answers may vary based on how the constraint are constructed.


CREATE TABLE rcv_destination
(dest_code NUMBER,
 dest_description VARCHAR2(100),
 city VARCHAR2(50) CONSTRAINT DEST_CITY_NN NOT NULL,
 country VARCHAR2(50) CONSTRAINT DEST_COUNTRY_NN NOT NULL,
 state char(2),
 price NUMBER(10,2) NOT NULL,
 CONSTRAINT DEST_COUNTRY_CK CHECK (state in ('BC', 'AB', 'SK', 'MB', 'ON', 'QC', 'NB',
    'NS', 'NL', 'NU', 'PE', 'YT') OR upper(country) != 'CANADA')
);

rem add a primary key using a alter table
ALTER TABLE rcv_destination
  ADD CONSTRAINT destination_pk PRIMARY KEY (dest_code);

CREATE TABLE rcv_rating
(rating_code CHAR(1) CONSTRAINT rating_pk PRIMARY KEY,
 rating_description VARCHAR2(50) CONSTRAINT RATING_DESC_NN NOT NULL
);


CREATE TABLE rcv_vacation_tour
(tour_code NUMBER,
 tour_description VARCHAR2(50),
 tour_region VARCHAR2(2) CONSTRAINT t_region_ck 
    CHECK (tour_region IN ('CA', 'US', 'EU')),
 rating_code CHAR(1),
 CONSTRAINT vt_pk PRIMARY KEY (tour_code)
);

ALTER TABLE rcv_vacation_tour
  MODIFY tour_region CONSTRAINT tr_nn NOT NULL
  MODIFY tour_description CONSTRAINT tour_desc_nn NOT NULL
  ADD CONSTRAINT vt_to_rating_fk FOREIGN KEY(rating_code)
    REFERENCES rcv_rating(rating_code)
  MODIFY rating_code CONSTRAINT tour_rating_code_nn NOT NULL;

rem creating bridging table, notice the use of a table constraint
rem to create a composite PK
CREATE TABLE rcv_tour_destination
( tour_code NUMBER CONSTRAINT td_to_vt_fk 
   REFERENCES rcv_vacation_tour(tour_code),
 dest_code NUMBER,
 CONSTRAINT td_pk PRIMARY KEY(dest_code, tour_code),
 CONSTRAINT td_to_dest_fk FOREIGN KEY(dest_code) 
   REFERENCES rcv_destination(dest_code),
 order# NUMBER(2)
);

CREATE TABLE rcv_agent
(agent_id NUMBER CONSTRAINT agent_pk PRIMARY KEY,
 first_name VARCHAR2(10) NOT NULL,
 last_name VARCHAR2(10) CONSTRAINT a_last_name_nn NOT NULL,
 agent_level VARCHAR2(4)
    CONSTRAINT agent_level_ck CHECK (agent_level IN ('I', 'II', 'III', 'IV', 'V'))
	NOT NULL,
 agent_speciality VARCHAR2(10)
    CONSTRAINT agent_speciality_ck CHECK (agent_speciality in ('CA', 'US', 'EU'))
	NOT NULL,
 years_experience NUMBER(2)
);

CREATE TABLE rcv_customer
(customer_number NUMBER,
 first_name VARCHAR2(30) NOT NULL,
 last_name VARCHAR2(30) NOT NULL,
 customer_phone VARCHAR2(12) NOT NULL,
 customer_street_address VARCHAR2(20) NOT NULL,
 customer_city VARCHAR2(15) NOT NULL,
 customer_province VARCHAR2(2),
 agent_id NUMBER NOT NULL
);
rem example of adding the PK and FK AFTER table creation using ALTER TABLE
ALTER TABLE rcv_customer
  ADD CONSTRAINT customer_pk PRIMARY KEY (customer_number)
  ADD CONSTRAINT cust_to_agent_fk FOREIGN KEY(agent_id) 
     REFERENCES rcv_agent(agent_id);

CREATE TABLE rcv_tour_customer
(tour_code NUMBER CONSTRAINT tc_to_vt_fk 
                                 REFERENCES rcv_vacation_tour(tour_code),
 customer_number NUMBER CONSTRAINT tc_to_cust_fk
                                 REFERENCES rcv_customer(customer_number),
 start_date DATE,
 end_date DATE
);
rem add composite PK using an ALTER TABLE command
ALTER TABLE rcv_tour_customer
  ADD CONSTRAINT tc_pk PRIMARY KEY (tour_code, customer_number);

CREATE TABLE rcv_training
(training_code NUMBER CONSTRAINT training_pk PRIMARY KEY,
 training_description VARCHAR2(50),
 duration_hours NUMBER(2)
);

CREATE TABLE rcv_agent_training
(agent_id NUMBER CONSTRAINT at_to_agent_fk 
                                 REFERENCES rcv_agent(agent_id),
 training_code NUMBER CONSTRAINT at_to_training_fk 
                                 REFERENCES rcv_training(training_code),
 date_completed DATE,
 CONSTRAINT at_pk PRIMARY KEY(agent_id, training_code)
);

spool off








 

