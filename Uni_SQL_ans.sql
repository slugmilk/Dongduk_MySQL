use Univ;

--- (1) To find all instructors in Comp. Sci. dept
    select name
    from instructor	
    where dept_name = 'Comp. Sci.';
--- (2) To find all instructors in Comp. Sci. dept with salary > 80000
	select name
    from instructor	
    where dept_name = 'Comp. Sci.'and salary > 80000;

--- (3) Find the Cartesian product instructor X teaches
     select *	from instructor, teaches;

--- (4) Find the names of all instructors who have taught some course and the course_id
    select name, course_id from instructor, teaches  where   instructor.ID = teaches.ID;

--- (5) Find the names of all instructors in the Art  department who have taught some course and the course_id
     select name, course_id from instructor, teaches  where   instructor.ID = teaches.ID and dept_name='Art';
     
--- (6) Find the names of all instructors who have a higher salary than some instructor in 'Comp. Sci'.
     select distinct T.name from instructor as T, instructor as S where T.salary > S.salary and S.dept_name = 'Comp. Sci.';

--- (7) Find the names of all instructors whose name includes the substring “dar”.
     select name from instructor where name like '%dar%'; 

--- (8) Find the names of all instructors with salary between $90,000 and $100,000
    select name from instructor where salary between 90000 and 100000;

--- (9) Find courses that ran in spring 2010  and in Fall 2009
--- (select course_id from teaches where semester = 'Fall' and year = 2009) intersect (select course_id from teaches where semester = 'Spring' and year = 2010);

     select course_id from teaches where semester = 'Fall' and year = 2009 and course_id in (select course_id from teaches where semester = 'Spring' and year = 2010);
     
--- (10) Find courses that ran in spring 2010 or in Fall 2009
     (select course_id from teaches where semester = 'Fall' and year = 2009) union (select course_id from teaches where semester = 'Spring' and year = 2010);
     
--- (11) Find courses that ran in all spring 2010 but not in Fall 2009
      select course_id from teaches where semester = 'Fall' and year = 2009 and course_id not in (select course_id from teaches where semester = 'Spring' and year = 2010);
      
--- (12) Find the average salary of instructors in the Computer Science department 
     select avg (salary) from instructor where dept_name= 'Comp. Sci.';

--- (13) Find the total number of instructors who teach a course in the Spring 2010 semester
     
     select count(distinct ID) from teaches where semester = 'Spring' and year = 2010;

--- (14) Find the number of tuples in the course relation
      select count(*) from course;

--- (15) Find the average salary of instructors in each department
	select dept_name, avg (salary) from instructor group by dept_name;

--- (16) Find the names and average salaries of all departments whose average salary is greater than 42000
     select dept_name, avg (salary)
     from instructor
     group by dept_name
     having avg (salary) > 42000;

--- (17) Find the total number of (distinct) students who have taken course sections taught by the instructor with ID 10101
     select count( distinct ID)
     from takes
     where (course_id, sec_id, semester, year) in (select course_id, sec_id, semester, year from teaches where teaches.ID= 10101);

--- (18) Find names of instructors with salary greater than that of some (at least one) instructor in the Comp. Sci. department.
	select name from instructor where salary > some (select salary from instructor where dept_name = 'Comp. Sci.');

--- (19) Find the names of all instructors whose salary is greater than the salary of all instructors in the Comp. Sci. department.
    select name from instructor where salary > all (select salary from instructor where dept_name = 'Comp. Sci.');

--- (20) Find all students who have taken all courses offered in the Biology department.
     select S.ID
     from student as S
     where not exists (select course_id
                                 from course
                                 where dept_name = 'Biology' and course_id not in (select T.course_id from takes as T where S.ID = T.ID));

--- (21) Delete all instructors from the Finance department
     delete from instructor   where dept_name= 'Finance';

--- (22) Delete all instructors whose salary is less than the average salary of instructors 
     delete from instructor where salary< (select avg (salary) from instructor);

--- (23) Increase salaries of instructors whose salary is over $100,000 by 3%, and all others by a 5% 
      set sql_safe_updates=0;
                 update instructor set salary = salary * 1.03  where salary > 100000;
                 update instructor set salary = salary * 1.05  where salary <= 100000;

--- (24) Add a new tuple to student  with tot_creds set to null
                 insert into student  values ('3003', 'Green', 'Finance', null);


