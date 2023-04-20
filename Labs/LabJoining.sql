
set echo on
set linesize 150
set pagesize 66
spool C:\cprg250s\joining.txt
rem Q1


column first_name format A10
column last_name format A10
column order# format 999999
column tour_description format A20
column dest_description format A70

break by first_name by last_name
select first_name, last_name, tour_description, order#, dest_description
from rcv_customer join rcv_tour_customer using (customer_number)
    join rcv_vacation_tour using (tour_code)
    join rcv_tour_destination using (tour_code)
    join rcv_destination using (dest_code)
where first_name = 'Sheldon' and last_name = 'Cooper'
order by 2,1,3,4;


rem Q2 

select first_name, last_name, tour_description, order#, dest_description
from rcv_customer c, rcv_tour_customer tc, rcv_vacation_tour vt, rcv_tour_destination td, rcv_destination d
where c.customer_number = tc.customer_number
    and tc.tour_code = vt.tour_code
    and vt.tour_code = td.tour_code
    and td.dest_code = d.dest_code
    and first_name = 'Sheldon' and last_name = 'Cooper'
order by 2,1,3,4;


clear breaks
clear columns
rem Q3 


column dest_description format A85
column first_name format A15
column last_name format A25
select distinct dest_description, first_name, last_name
from rcv_customer c right outer join rcv_tour_customer tc on c.customer_number = tc.customer_number
    left outer join rcv_vacation_tour vt on tc.tour_code = vt.tour_code
    left outer join rcv_tour_destination td on vt.tour_code = td.tour_code
    right outer join rcv_destination d on td.dest_code = d.dest_code
where d.country = 'Canada'
order by 1,3,2;
clear columns
rem Q4 


break by first_name by last_name
select first_name, last_name, training_description, date_completed
from rcv_agent natural join rcv_agent_training natural join rcv_training
order by 1, 2, 3;


rem Q5 



spool off

