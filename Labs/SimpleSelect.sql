rem Lab Unit 10-11 Simple SELECT and Sorting 
set echo on
set linesize 200
set pagesize 66
spool C:\cprg250s\Lab_Output.txt

rem Q1 - basic select columns with headers

select first_name, last_name
from rcv_agent
where agent_level in ('III', 'IV') and upper(agent_speciality) != 'CA'
order by last_name;

rem Q2 

select tour_description
from rcv_vacation_tour
where upper(rating_code) in ('E', 'M') and tour_description like '%Paris%'
order by tour_description;

rem Q3 

column country format A80
select country, dest_description
from rcv_destination
where initcap(country) in ('Canada', 'United States')
order by country, dest_description;
clear columns;

rem Q4 



rem Q5 




spool off

