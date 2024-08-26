------------------------------------------Creation of Spring23_S003_22_Employee Relation------------------------------
create table Spring23_S003_22_Employee(
              Emp_ID int primary key,
              FName varchar(20) not null,
              MName varchar(20),
              LName varchar(20) not null,
              SSN varchar(15) not null unique,
              PhysicalAddress varchar(100) not null,
              BDate date not null,
              StoreID int not null
);
       

------------------------------------------Creation of Spring23_S003_22_EmployeePhoneNumber Relation------------------------------
create table Spring23_S003_22_EmployeePhoneNumber(
           Emp_ID int references Spring23_S003_22_Employee(Emp_ID),
           PhoneNumber varchar(100),
           primary key(Emp_ID,PhoneNumber)
);


------------------------------------------Creation of Spring23_S003_22_Store_Details Relation------------------------------
create table Spring23_S003_22_Store_Details(
            StoreID int primary key,
            ZipCode varchar(10) not null,
            Mgr_ID int REFERENCES Spring23_S003_22_Employee(Emp_ID) not null,
            Mgr_SSN varchar(15) REFERENCES Spring23_S003_22_Employee(SSN) not null,
            City varchar(15) not null,
            State varchar(20) not null,
            Y_Investment decimal(10, 2) not null,
            Y_Income  decimal(10, 2) not null
);
    

------------------------------------------Creation of Spring23_S003_22_Customer Relation------------------------------


create table Spring23_S003_22_Customer(
             CustID int primary key,
             CustomerName varchar(100) not null,
             Amount decimal (10, 2) not null,
             Email varchar(50) not null,
             ContactNumber varchar(100)

);


------------------------------------------Creation of Spring23_S003_22_Category Relation------------------------------

create table Spring23_S003_22_Category(
             CatID int primary key,
             CatName varchar(50) not null,
             NumberOfItems int not null,
             TotalCost decimal(10,2)
);

------------------------------------------Creation of Spring23_S003_22_Products Relation------------------------------

create table Spring23_S003_22_Products(
              PdtID int primary key,
              PdtName varchar(100) not null,
              PdtAvailability CHAR(1) CHECK (PdtAvailability IN ('Y', 'N')) not null ,
              PriceOfPdt decimal(7,2) not null,
              PdtLocation varchar(5) not null,
              PdtType varchar(100) not null,
              CategoryID int references Spring23_S003_22_Category(CatID) not null,
              StoreID int  references Spring23_S003_22_Store_Details(StoreID) not null
);


------------------------------------------Creation of Spring23_S003_22_Buys Relation------------------------------
create table Spring23_S003_22_Buys(
             CustID int references  Spring23_S003_22_Customer(CustID) ,
             PdtID int references  Spring23_S003_22_Products(PdtID),
             primary key(CustID , PdtID)
);


------------------------------------------Creation of Spring23_S003_22_Buys_b_Info Relation------------------------------
create table Spring23_S003_22_Buys_b_Info(
             CustID int not null,
             PdtID int not null,
             FOREIGN KEY (CustID,PdtID)   references  Spring23_S003_22_Buys(CustID,PdtID) ,
             BIDate date not null,
             Quantity int not null,
             primary key(CustID , PdtID,BIDate,Quantity)
);


------------------------------------------Creation of Spring23_S003_22_BillingMachine Relation------------------------------
create table Spring23_S003_22_BillingMachine(
             MachineID int primary key,
             StoreID int references Spring23_S003_22_Store_Details(StoreID),
             EmpID int not null,
             MDate date not null,
             MTime varchar(100) not null,
             totalCost decimal(10,2) not null,
             NoOfPurchasesPerDay int not null
);


------------------------------------------Creation of Spring23_S003_22_Purchases Relation------------------------------
create table Spring23_S003_22_Purchases(
             PurchaseID int primary key,
             MachineID int references Spring23_S003_22_BillingMachine(MachineID),
             PDate date not null,
             PTime varchar(100) not null,
             totalCost decimal(10,2) not null,
             NoOfItems int not null,
             CustID int references Spring23_S003_22_Customer(CustID)
);

------------------------------------------Creation of Spring23_S003_22_Purchases_Category Relation------------------------------

create table Spring23_S003_22_Purchases_Category(
             PurchaseID int references Spring23_S003_22_Purchases(PurchaseID),
             CatID int not null,
             primary key(PurchaseID,CatID)
             
);
