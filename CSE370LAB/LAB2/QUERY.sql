**'very important for lab mid'**

#lab2
#https://docs.google.com/document/d/1j6zmKf3cUr7zQKNxByfRPh0_AaTUn3hTyW6_AKuCFQA/edit?tab=t.0
#https://docs.google.com/document/d/14jTrk1qVuzYbH5851neFEoiSsBmK2yVrfyoSwyfwbPQ/edit?tab=t.0
#https://drive.google.com/file/d/1tw3lKC1zsUjlNLYoPMReEc_RibH36ExN/view

Aggregate Functions
Group by / Having by

The keywords in a SQL statement are executed in the following order:
1. FROM: Specify tables
2. WHERE: Filter rows/records
3. GROUP BY: Group filtered rows/records
4. HAVING: Filter groups
5. SELECT: Select columns and expressions
6. ORDER BY: Sort the result
7. LIMIT/OFFSET: Limit the number of returned rows



ANY & ALL

ANY RETURNS TRUE WHEN ANY OF THE CONDITION IS TRUE

ALL RETURNS TRUE WHEN ALL OF THE CONDITION IS TRUE

Find the CSE students whose CGPA is higher than at
least 1 CS students

SELECT * FROM Lab_Grades WHERE major = 'CSE' AND
cgpa > ANY (SELECT cgpa FROM Lab_Grades WHERE major =
'CS');

Find the CSE students whose CGPA is higher than ALL CS students

SELECT * FROM Lab_Grades WHERE major = 'CSE' AND
cgpa > All (SELECT cgpa FROM Lab_Grades WHERE major =
'CS');


#Co-related SubQueries which is basically a top down approch , much like a nested for looop

#Exists returns if the condition is true 
#distinct returns only the distinct elements
NOT exists

when to use co related sub query ?
==> if the concept of nested is used to find the solve comes to mind , then
 its surely co related sub query


 LABASSIGNMENT query
#2
  select first_name, last_name, employee_id, phone_number, salary , department_id  
   from employee order by salary asc;
#3
select  first_name, last_name, employee_id, commission_act , department_id from employee where department_id='DPT007' 
AND commission_act < all (select commission_act from employee where department_id='DPT005');

No 4 Query
(as Plain Text)
SELECT Department_ID,  COUNT(Employee_ID) AS NumberOfEmployees
FROM Employee
WHERE Salary < 30000 Group by Department_id;

No 5 Query
(as Plain Text)
select distinct e1.department_id , e1.job_id, e1.commission_pct
    -> from employee e1
    -> where
    -> exists (select 1 from employee e2 where e2.department_id=e1.department_id and
    -> e2.job_id != e1.job_id
    -> and
    -> e2.commission_pct > e1.commission_pct);

No 6 Query
(as Plain Text)
select distinct manager_id from employee where manager_id not in 
(select distinct manager_id from employee where salary < 3500);



No 7 Query
(as Plain Text)
SELECT
    e1.first_name,
    e1.last_name,
    e1.employee_id,
    e1.email,
    e1.salary,
    e1.department_id,
    e1.commission_pct
FROM
    Employee e1
WHERE
    e1.Commission_Pct = (

        SELECT
            MIN(e2.Commission_Pct)
        FROM
            Employee e2
        WHERE
            e2.Manager_ID = e1.Manager_ID
    );



