--Create grand hill database
--Feb 28

spool c:\cprg250s\grandHillOutput.txt
set echo on

--drop child tables followed by parent tables
drop table ghc_expertise;
drop table ghc_faculty;
drop table ghc_department;
drop table ghc_course;

--create parent tables, then child tables
create table ghc_course(
    course_code char(7) constraint sys_ghc_course_pk primary key,
    course_title varchar2(60) not null,
    credits number(2) not null constraint sys_ghc_course_credits_ck
        check(credits between 1 and 9)
);

create table ghc_department(
    dept_no number,
    dept_name varchar2(20)
);

alter table ghc_department
    add constraint sys_ghc_department_pk primary key(dept_no)
    add constraint sys_ghc_dept_name_uk unique(dept_name);
alter table ghc_department
    modify(dept_name not null);

create table ghc_faculty(
    faculty_id number constraint sys_ghc_faculty_pk primary key,
    surname varchar2(50) not null,
    firstname varchar2(50) not null,
    date_hired date not null,
    date_fired date,
    is_active number(1) not null constraint sys_ghc_fac_active_ck
        check (is_active in (0, 1)),
    dept_no number constraint sys_ghc_dept_faculty_fk foreign key
        references ghc_department(dept_no) not null
);

create table ghc_expertise(
    faculty_id number,
    course_code char(7),
    constraint sys_ghc_expertise_pk primary key(faculty_id, course_code),
    constraint sys_ghc_fac_expertise_fk foreign key(faculty_id)
        references ghc_faculty(faculty_id),
    constraint sys_ghc_course_expertise_fk foreign key(course_code)
        references ghc_course(course_code)
);

spool off