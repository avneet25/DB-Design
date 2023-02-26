# Realistic-DB-Design

## PRESTIGE COMPANY DATABASE
To make this company database realistic, the following extra ASSUMPTIONS HAVE BEEN MADE (since the requirements document is vague/generalised) :<br /> 
1. The company deals with only one type of supplies from all its suppliers
2. SALE CLASSIFICATION
   - Individual: A company retail store sells to individuals directly
   - Wholesale: A company warehouse sells items in wholesale to small retailers
   
3. EMPLOYEE CLASSIFICATION
 - Central Employees
     - Work at company headquarters central to the company <br />
     - overlook functioning of all branches (retail and warehouse) 
     - (I) Manager: 4 departments = 4 managers
     - (ii) Purchase agents: individuals hired to research & purchase discounted items (9% commission on total sales).
     - (iii) Accounting staff: Manage accounts
     
 - Retail/Warehouse Employees
     - (iv) Retail associates: belong to a particular retail store
     - (v) Warehouse associates: belong to a particular warehouse
     
4. All employees fall under a particular department whose head is a manager. 
 - purchase agents --> Purchase department
 - Retail associates --> Sales department
 - Warehouse associates --> Warehouse department
 - Accounting staff --> Accounts department
 
5. The term BRANCH includes both – retail stores AND warehouses. <br />

![DB](https://user-images.githubusercontent.com/82283086/221386871-0335b46f-445e-4e4e-9950-2446e49a21ef.png)

5 Relations:
1. Branch: Limited branches and each branch has a unique branchID so --> primary key
2. Sales: branchID, Qtr, Year will altogether uniquely identify a tupple so --> primary key
3. Employee: each employee shall have a unique employeeID (P key).
   - Each employee works for a branch (retail/warehouse/headqtrs) so branchID attribute is F key
   - Each employee works under a dept so deptName attribute (F key)
4. Department: 4 depts each with a unique name so deptName is P Key.
   - Each dept headed by a manager who is also an employee so mgrID is a foreign key referencing Employee table
5. Sales: A purchasing agent may buy from the same supplier twice so empID, supplierName and totalCost altogether form P key.
   - Purchasing agent is also an employee so empID references employee table

