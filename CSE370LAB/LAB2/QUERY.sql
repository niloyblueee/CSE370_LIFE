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