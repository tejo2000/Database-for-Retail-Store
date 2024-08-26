


-----------------ADHOC------------
-----1.Gets StoreID and No of Employees where  more than 6 employees work in it and store  Avg Income >40000 ------------------- 

SELECT E.StoreID, COUNT(*) as NumEmployees, AVG(Y_Income) as AvgIncome
FROM Spring23_S003_22_Employee E
JOIN Spring23_S003_22_Store_Details S ON E.StoreID = S.StoreID
GROUP BY E.StoreID
HAVING COUNT(*) > 6 AND AVG(Y_Income) > 40000 order by StoreID asc;


-----------2.Retrieve the average price of products in each category for each specific store:-----------
SELECT c.CatID, c.CatName, AVG(p.PriceOfPdt) AS AvgPrice
FROM Spring23_S003_22_Category c
JOIN Spring23_S003_22_Products p ON c.CatID = p.CategoryID
GROUP BY c.CatID, c.CatName order by CatID asc;

------3.This command retrieves the Employees name and their address who are working in stores that have   total income <600000-------

SELECT E.Fname , E.LName,E.PhysicalAddress, SUM(S.Y_Income) as TotalIncome,S.StoreID
FROM Spring23_S003_22_Store_Details S
JOIN Spring23_S003_22_Employee E ON S.Mgr_ID = E.Emp_ID
GROUP BY E.PhysicalAddress,S.StoreID,E.Fname , E.LName
HAVING SUM(S.Y_Income) < 600000 order by S.StoreID;




-------------4 Getting the Purchases of particular Store ID-------------------
select bm.StoreID ,SUM(p.totalCost) as PurCOST FROM Spring23_S003_22_Employee e
JOIN Spring23_S003_22_BillingMachine bm ON e.Emp_ID = bm.EmpID
JOIN Spring23_S003_22_Purchases p ON bm.MachineID = p.MachineID
group by bm.StoreID
order by bm.StoreID asc;

-----------------5(Division) Getting Tuples of employee who did not work on any machine.--------------------
SELECT E.Emp_ID,E.FName,E.MName,E.LName,E.SSN
FROM Spring23_S003_22_Employee E
WHERE NOT EXISTS (
    SELECT *
    FROM Spring23_S003_22_BillingMachine BM
    WHERE BM.EmpID = E.Emp_ID 
)order by E.Emp_ID  asc;

-----------------6(Division with Fetch) Getting first 10 Tuples of employee who did not work on any machine.--------------------

SELECT E.*
FROM Spring23_S003_22_Employee E
WHERE NOT EXISTS (
    SELECT *
    FROM Spring23_S003_22_BillingMachine BM
    WHERE BM.EmpID = E.Emp_ID 
)order by E.Emp_ID  asc 
FETCH First 10 ROWS ONLY;


--------------7.ROLLUP : total quantity of each product (TotalQuantity) bought by each customer --------------

SELECT b.CustID, p.PdtName, SUM(bb.Quantity) as TotalQuantity
FROM Spring23_S003_22_Buys_b_Info bb
JOIN Spring23_S003_22_Buys b ON bb.CustID = b.CustID AND bb.PdtID = b.PdtID
JOIN Spring23_S003_22_Products p ON b.PdtID = p.PdtID
GROUP BY ROLLUP (b.CustID, p.PdtName);

--------------8.CUBE :  --------------
SELECT b.CustID, p.PdtName, SUM(bb.Quantity) as TotalQuantity
FROM Spring23_S003_22_Buys_b_Info bb
JOIN Spring23_S003_22_Buys b ON bb.CustID = b.CustID AND bb.PdtID = b.PdtID
JOIN Spring23_S003_22_Products p ON b.PdtID = p.PdtID
GROUP BY CUBE (b.CustID, p.PdtName);


-----------------------9.Like Operator:retrieve only the employees whose last name including  'Smith'.------------------------------

SELECT e.Emp_ID, e.FName, e.LName, s.StoreID, s.City
FROM Spring23_S003_22_Employee e
JOIN Spring23_S003_22_Store_Details s ON e.StoreID = s.StoreID
WHERE e.LName LIKE '%smith%'


------------------------------10-Over operator--------------------------


SELECT   MachineID,Emp_ID, totalCost, 
       SUM(totalCost) OVER (PARTITION BY MachineID) AS TotalAmountByEmployee
FROM Spring23_S003_22_BillingMachine
INNER JOIN Spring23_S003_22_Employee ON Spring23_S003_22_BillingMachine.EmpID = Spring23_S003_22_Employee.Emp_ID;



----------------END-------------




