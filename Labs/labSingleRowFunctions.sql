set echo on

set linesize 120
set pagesize 66


spool C:\cprg250s\labSelect.txt


column 'Desc' format A25
column 'Start Date' format A25
column 'Dest Desc' format A15
column 'Duration' format A10
break on 'Desc' on 'Start Date' on 'Duration'

select
    initcap(tour_description) "Desc", to_char(start_date, 'MON dd, yyyy') "Start Date",
    concat(end_date - start_date, ' Days') "Duration",
    order# "Num",
    substr(dest_description,1,15) as "Dest Desc",
    to_char(price, '$9,999.00') "Price"
from rcv_customer c join rcv_tour_customer using(customer_number)
    join rcv_vacation_tour using(tour_code)
    join rcv_tour_destination using(tour_code)
    join rcv_destination using(dest_code)
where lower(first_name) = 'amy' and lower(last_name) ='folwer'
order by tour_description, order#;

clear columns
clear breaks

column 'Desc' format A40
column 'Cost' format A5
column 'Country' format A20
column 'City' format A15

select dest_description "Desc",
    case when price < 50 then '$'
       when price between 50 and 100 then '$$'
       when price between 100 and 200 then '$$$'
       when price between 200 and 500 then '$$$$'
       else '$$$$$' end as "Cost",
    upper(country) "Country",
    city "City"
from rcv_destination 
where country not in ('Canada', 'United States')
order by country, city, "Cost";

clear columns

column 'Desc' format A80
column 'Country' format A25
column 'State' format A10
select dest_description "Desc",
       decode(initcap(country), 'United States', 'USA', initcap(country)) "Country",
       nvl(upper(state), 'NA') AS "State"
from rcv_destination r
where
    instr(lower(dest_description), 'cook') > 0 or 
    instr(lower(dest_description), 'wine') > 0 or 
    instr(lower(dest_description), 'dinner') > 0;

clear columns

spool off