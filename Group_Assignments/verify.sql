rem lab0test.sql
set echo on
set verify on
set pagesize 66
set linesize 100
spool c:/cprg250s/justLeeOutput.txt
rem Just Lee Database

rem show customers and books they have ordered
rem should return 32 rows
select firstname, lastname, title
from customers natural join orders
   natural join orderitems 
   natural join books
order by 2,1,3;

spool off
