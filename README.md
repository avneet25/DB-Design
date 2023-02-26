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
 
5. The term BRANCH includes both – retail stores AND warehouses. 

6. A supplier may work with different agents and an agent can work with different suppliers. <br />

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
 
![ER](https://user-images.githubusercontent.com/82283086/221387560-777b8044-a9ba-4239-8140-4f2faeba299c.png)

## CONVERTING ER MODEL TO RELATION SCHEMA
### Initial set of relation schemas
1. Employee ( emp_id, first_name, Last_name, sex, salary, DOB)
2. Branch (branch_id, branch_name, location)
3. Dept (dept_name)
4. Supplier (emp_id, purchase_id, supp_name)
5. Works_with (purchase_id, emp_id, sales, commission)
6. Works_for (emp_id, dept_name). //REDUCED
7. Manages (dept_name, emp_id). //REDUCED
8. Belongs_to (emp_id, dept_name). //REDUCED

### Remaining set of relation schemas
1. Employee (emp_id, first_name, Last_name, sex, salary, DOB, branch_id, dept_name)
2. Branch (branch_id, branch_name, location)
3. Dept (dept_name, mgr_id)
4. Supplier (purchase_id, emp_id, supp_name)
5. Works_with (purchase_id, emp_id, sales, commission)

### Explanation: 
For explaining why a relational schema is reduced I shall go back to the ER model and start converting it to a relational schema. Following the steps will provide as an explanation in itself.

1. Mapping regular entity type:
Employee, Branch, Department

2. Mapping weak entity types: Supplier
Primary key of new relation = primary key of owner/identifying set + discriminators

3. Mapping 1:1 relationship:
Include one side’s primary key as a foreign key on the other side favouring total participation.
HERE MANAGES IS REDUCED and department is modified to: 

Where mgr_id references emp_id of employee table


4. Mapping 1: N relationship:
Include the 1 side’s primary key as a foreign key on the N side.
HERE BELONGS_TO and WORKS_FOR are reduced. Employee table is modified to:

And then:



5. Mapping M:N relationship:
Create a new relation whose primary key is the combination of both sides primary keys and include any relationship attributes.
Works_with:




