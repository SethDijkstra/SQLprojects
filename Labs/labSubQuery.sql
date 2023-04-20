set echo on
set pagesize 66
set linesize 120

spool C:\cprg250s\labSubQuery.txt



select tour_description, to_char(sum(price), '$9,999.00') "Price"
from rcv_destination join rcv_tour_destination using (dest_code)
     join rcv_vacation_tour using (tour_code)
having sum(price) =
    (select max(sum(price))
     from rcv_destination join rcv_tour_destination using (dest_code)
     join rcv_vacation_tour using (tour_code)
     group by tour_code)
group by tour_description;


select tour_description, to_char(sum(price), '$9,999.00') "Price"
from rcv_destination join rcv_tour_destination using(dest_code)
     join rcv_vacation_tour using (tour_code)
where tour_region = 'EU' and tour_description in
    (select tour_description
    from rcv_destination join rcv_tour_destination using(dest_code)
         join rcv_vacation_tour using (tour_code)
    group by tour_description
    having sum(price) > any
        (select sum(price)
        from rcv_destination join rcv_tour_destination using(dest_code)
        join rcv_vacation_tour using (tour_code)
        where tour_region = 'CA'
        group by tour_description))
group by tour_description;


Column dest_description format A85
Column 'Price' format A12
select dest_description, to_char(price, '$9,999.00') "Price"
from rcv_destination
where price <
    (select avg(avg(price)) Average
    from rcv_destination
    group by dest_description);
clear columns



select distinct first_name, last_name
from rcv_customer join rcv_tour_customer using(customer_number)
where tour_code not in
    (select tour_code
    from rcv_agent a join rcv_customer using(agent_id)
        join rcv_tour_customer using (customer_number)
    where a.first_name = 'Ethan' and a.last_name = 'Hunt');


spool off
