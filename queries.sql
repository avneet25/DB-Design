 
-- List the sales in 2021 by retail stores
select branchName, sum(qtrly_Sales)
from branch as B, sales as S
where B.branchID = S.branchID and year = '2021' and branchName in ( select branchName from branch where branchID = '2'
UNION
select branchName from branch where branchID = '3' UNION
select branchName from branch where branchID = '4' )
group by branchName;

-- List all employees and their managers
select E.empID, E.first_name as empId, M.first_name as mgrId, E.deptName 
from employee as E, employee as M
where E.empId <> M.empID and M.empID in
( select mgrID
 from department
 where department.deptName = E.deptName );
 
-- How many female and male managers are there? select sex , count(sex) as count
from employee, department
where empID = mgrID
group by sex;

-- Which branch had highest sales in quarter 1 of 2021 
select B.branchID, branchName, qtrly_Sales as Highest_sales 
from sales as S, branch as B
where S.branchID = B.branchID and qtrly_Sales in (
select max(qtrly_Sales)
from sales
where qtr = 1 and year = 2021
);

-- Find the employee with the highest total commission in the purchasing department
select E.empID, first_name, last_name, Commision as TotalCommision from employee as E,
(select empID, sum(Commision) as Commision
from supplier
group by empID) as T
where E.empID = T.empID and Commision in ( select max(Commision)
from (select empID, sum(Commision) as Commision 
	  from supplier
      group by empID) as T );
	  
-- Find the manager of “Hadley Steadman” 
select first_name, last_name
from employee, department
where empID = mgrID and empID in (
select mgrID
from department
where deptName in (
select deptName
from employee as E
where first_name = 'Hadley' and last_name = 'Steadman'));

-- List the sales in 2021 by retail stores
select branchName, sum(qtrly_Sales)
from branch as B, sales as S
where B.branchID = S.branchID and year = '2021' and branchName in ( select branchName from branch where branchID = '2'
UNION
select branchName from branch where branchID = '3' UNION
select branchName from branch where branchID = '4' )
group by branchName;

-- Find employees whose birthday falls in November 
select first_name, last_name, dob
from employee
where dob like '%/11/%';
