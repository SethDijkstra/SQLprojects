set echo on

set linesize 120
set pagesize 66

spool C:\cprg250s\groupFunctionsOutput.txt


column 'Tour' format A30
select tour_description "Tour",
       count(dest_code) "# of destinations",
       to_char(sum(price),'$9,999.00') "Total"
from rcv_vacation_tour join rcv_tour_destination using(tour_code)
     join rcv_destination using(dest_code)
group by tour_description
having count(dest_code) > 3;

clear columns


select sum(price) "Total for all customers"
from rcv_destination join rcv_tour_destination using(dest_code)
     join rcv_vacation_tour using(tour_code)
     join rcv_tour_customer using(tour_code)
where tour_code is not null;

--select customer_number, sum(price)
--from rcv_destination join rcv_tour_destination using(dest_code)
 --    join rcv_vacation_tour using(tour_code)
 --    join rcv_tour_customer using(tour_code)
--group by customer_number;

spool off