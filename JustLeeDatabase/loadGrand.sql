set echo on
spool C:\cprg250s\JustLeeDatabase\load.txt

--delete existing data from tables, children followed by parents

delete ghc_expertise;
delete ghc_course;
delete ghc_faculty;
delete ghc_department;

insert into ghc_department (dept_no, dept_name)
    values (100, 'Astrophysics');


insert into ghc_faculty (faculty_id, surname, firstname, date_hired, date_fired, is_active, dept_no)
    values (1001, 'Faulkner', 'Danny', '01-JAN-22', null, 1, 100);


insert into ghc_course (course_code, course_title, credits)
    values ('APHY202', 'The Solar System', 5);
insert into ghc_course (course_code, course_title, credits)
    values ('APHY203', 'Nebula', 5);
insert into ghc_course (course_code, course_title, credits)
    values ('APHY204', 'Global Clusters', 5);






insert into ghc_expertise (faculty_id, course_code)
    values(1001, 'APHY202');
insert into ghc_expertise (faculty_id, course_code)
    values(1001, 'APHY203');
insert into ghc_expertise (faculty_id, course_code)
    values(1001, 'APHY204');








commit;
select * from ghc_department;
select * from ghc_course;
select * from ghc_faculty;
select * from ghc_expertise;



insert into ghc_course (course_code, course_title, credits)
    values ('APHY302', 'Nebula', 5);

update ghc_expertise
set course_code = 'APHY302'
where course_code = 'APHY203';


delete from ghc_course
where course_code = 'APHY203' and course_title = 'Nebula';

commit;
select * from ghc_course;
select * from ghc_expertise;

delete from ghc_expertise 
where faculty_id=1001;

delete from ghc_faculty
where surname = 'Faulkner' and faculty_id = 1001;

commit;
select * from ghc_course;
select * from ghc_expertise;

spool off