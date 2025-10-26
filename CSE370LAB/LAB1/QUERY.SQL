mysql -u root

SHOW DATABASE;
CREATE DATABASE CSE370_LAB1;

USE CSE370_LAB1;

CREATE TABLE Lab_Grades
(
     std_id char(4),
     name varchar(30), 
     major char(3),
     section char(1),
     days_present int,
     project_marks double,
     cgpa decimal(3,2),
     submission_date date
);

# char => fixed memory allocation
# varchar => not fixed so whatver used is used , rest is free to use else where internally
# double => 
# decimal =>  
#

INSERT INTO Lab_Grades 
values
('s001', 'Abir', 'CS', '1', 10, 18.5, 3.91, '2018-09-15'),
('s002', 'Nafis', 'CSE', '1', 12, 20, 3.86, '2018-08-15'),
('s003', 'Tasneem', 'CS', '1', 8, 18, 3.57, '2018-09-18'),
('s004', 'Nahid', 'ECE', '2', 7, 16.5, 3.25, '2018-08-20'),
('s005', 'Arafat', 'CS', '2', 11, 20, 4, '2018-09-13'),
('s006', 'Tasneem', 'CSE', '1', 12, 17.5, 3.7, '2018-08-15'),
('s007', 'Muhtadi', 'ECE', '1', 10, 19, 3.67, '2018-09-16'),
('S008', 'Farhana', 'CSE', '2', 6, 15, 2.67, '2018-08-16'),
('s009', 'Naima', 'CSE', '2', 12, 20, 3.7, '2018-08-14');


SELECT * FROM LAB_GRADES;

SELECT NAME FROM LAB_GRADES;

ALTER TABLE LAB_GRADES ADD PROJECT_TITLE CHAR(10);

ALTER TABLE LAB_GRADES MODIFY COLUMN PROJECT_TITLE VARCHAR(50) ;

#rename

ALTER TABLE LAB_GRADES CHANGE COLUMN submission_date sub_date DATE;

#modify specific person
update lab_grades set major = "cse" where std_id = "s005";

#delete a user
delete from lab_grades where std_id = "s009"; 


#specific

select * from lab_grades where days_present < 7 ;

#eq
select name, project_marks+days_present*5/12 from lab_grades ;

#eq2
select name, project_marks+days_present*5/12 as total_marks from lab_grades ;

#distict values

select distinct  major from lab_grades;

#sort wise 

select  * from lab_grades order by project_marks;

#descinding

select  * from lab_grades order by project_marks desc;

#multilevel sorting
select  * from lab_grades order by project_marks desc, days_present asc;

#between

select name , project_marks from lab_grades where project_marks  between 17 and 19;

select name , project_marks from lab_grades where project_marks >= 15 and project_marks <19 ;

#date wise search

select name , project_marks from lab_grades where sub_date < '2018-09-15';


#limit by 1  
select name , project_marks  from lab_grades order by project_marks desc limit 1 ;

#offset 2nd best example
select name , project_marks  from lab_grades order by project_marks desc limit 1 offset 1 ;

# update 
UPDATE DEVLOPERS SET followers = followers + 10 ;

#filtering by name/

select * from lab_grades where name like "A%"; #we know starts with a 

select * from lab_grades where name like "%A"; #we know ends with a

select * from lab_grades where name like "%e%e%"; #we know the there are 2 e

select * from lab_grades where name like "_A%"; #we know the second letter was a

