set echo on
set linesize 120
set pagesize 66

spool C:\cprg250s\Group_Assignments\subquery.txt

select state "ST", customer#, title
from customers join orders using(customer#)
     join orderitems using(order#)
     join books using(isbn)
where state not in 'TX' and title in
    (select title
    from customers join orders using(customer#)
        join orderitems using(order#)
        join books using(isbn)
    where state like 'TX')
order by title;




select distinct title, state "ST"
from customers join orders using(customer#)
     join orderitems using(order#)
     join books using(isbn)
where isbn in 
    (select isbn
    from customers join orders using(customer#)
        join orderitems using(order#)
        join books using(isbn)
    group by isbn
    having count(distinct state) = 
        (select max(count(distinct state)) "Count"
        from customers join orders using(customer#)
            join orderitems using(order#)
            join books using(isbn)
        group by isbn))
order by title, state;


select distinct title
from customers join orders using(customer#)
     join orderitems using(order#)
     join books using(isbn)
where isbn = (
    select isbn
    from ( select isbn, sum(quantity) as quantity_ordered
        from customers join orders using(customer#)
             join orderitems using(order#)
             join books using(isbn)
             group by isbn)
    where quantity_ordered = (
        select max(quantity_ordered)
        from (select sum(quantity) as quantity_ordered
            from customers join orders using(customer#)
             join orderitems using(order#)
             join books using(isbn)
            group by isbn)));

select distinct category, title, orderdate
from books join orderitems using(isbn)
     join orders using(order#)
where (category, orderdate) in
    (select category, max(orderdate)
    from books join orderitems using(isbn)
    join orders using(order#)
    group by category)
order by category, title;

spool off