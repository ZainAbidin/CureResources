--CREATING TABLES
CREATE TABLE Employees(ID INT, EmployeeCode INT, Fname VARCHAR(20), Lname VARCHAR(20), City VARCHAR(20), Country VARCHAR(20), Username VARCHAR(20), AGE INT, Acitvity VARCHAR(9), [Items Issued] VARCHAR(20))
CREATE TABLE Users (UserName VARCHAR(20), Pword VARCHAR(20))
ALTER TABLE Users
ADD FName VARCHAR(20)
ALTER TABLE Users
ADD LName VARCHAR(20)
ALTER TABLE Users
ADD City VARCHAR(20)
ALTER TABLE Users
ADD Country VARCHAR(20)
ALTER TABLE Users
ADD FName VARCHAR(20)
ALTER TABLE Users
ADD Roles VARCHAR(5)
ALTER TABLE Users
ADD EmployeeCode INT
ALTER TABLE Employees
ADD AGE INT

CREATE TABLE messsages (Username VARCHAR(20), [Message] VARCHAR(255))
------------------------------------------

--Stored procedure to check credentials
CREATE or alter PROCEDURE spCheckCredentials
@Username VARCHAR(20),
@Password VARCHAR(20)
AS
BEGIN
	SELECT Roles FROM Users	
	WHERE BINARY_CHECKSUM (UserName) = BINARY_CHECKSUM (@Username) AND BINARY_CHECKSUM(Pword) = BINARY_CHECKSUM(@Password)
END
--------------------------------------------
--Stored procedure to Issue Item

CREATE OR ALTER PROCEDURE spIssueItem
@Item VARCHAR(20),
@Username VARCHAR(20)
AS
BEGIN

IF ((@Item = 'Laptop') OR (@Item = 'Chair') OR (@Item = 'LCD'))
BEGIN
	IF((SELECT (LEN([Items Issued])-LEN(REPLACE([Items Issued],@Item,'')))/LEN(@Item)
		FROM Employees WHERE Username = @Username) > 0) 
		BEGIN
			SELECT 1
			--DONT UPDATE
		END
	ELSE
		BEGIN
			SELECT 0
			--UPDATE
			UPDATE Employees SET [Items Issued] = CONCAT(@Item,', ',[Items Issued]) WHERE Username= @Username
		END
END

ELSE IF((@Item = 'Mouse') OR (@Item = 'Headphones'))
BEGIN
	IF((SELECT (LEN([Items Issued])-LEN(REPLACE([Items Issued],@Item,'')))/LEN(@Item)
		FROM Employees WHERE Username = @Username) > 1)
		BEGIN
			SELECT 1
			--DONT UPDATE
		END
	ELSE
		BEGIN
			SELECT 0
			--UPDATE
			UPDATE Employees SET [Items Issued] = CONCAT(@Item,', ',[Items Issued]) WHERE Username= @Username
		END
END
END
-----------------------------------

--Stored Procedure to Change Employee Stautus by Admin
CREATE OR ALTER PROCEDURE spActivity
@Username VARCHAR(20)
AS
BEGIN
			if(select 1 from Employees where Username = @Username AND Activity='Active') > 0
			BEGIN
			update Employees set Activity='Inactive' where Username = @Username
			END
			else
			BEGIN
			update Employees set Activity='Active' where Username = @Username
			END
END
-----------------------------------------

--Stored Procedure to Idntify User for Employee page

CREATE OR ALTER PROCEDURE spuserIdentify
@Username VARCHAR(20)
AS
BEGIN
	SELECT * FROM Employees	WHERE UserName = @Username 
END

----------------------------
--Stored Procedure for a new user sign up

CREATE OR ALTER PROCEDURE spuserSignup
@Username VARCHAR(20),
@FirstName VARCHAR(20),
@LastName VARCHAR(20),
@City VARCHAR(20),
@Age INT,
@COUNTRY VARCHAR(20),
@EmployeeCode INT,
@ConfirmPassword VARCHAR(20)
AS
DECLARE @ResultValue int 

If(SELECT 1 FROM EMPLOYEES WHERE EmployeeCode = @EmployeeCode) > 0
BEGIN
	SET  @ResultValue = 0
END
ELSE
BEGIN
	INSERT INTO Employees (EmployeeCode,Fname,Lname,City,Country,Username,[Items Issued],AGE)
	VALUES (@EmployeeCode,@FirstName,@LastName,@City,@Country,@Username,'',@Age)
	INSERT INTO Users(UserName,Pword,Roles,EmployeeCode)
	VALUES (@Username,@ConfirmPassword,'User',@EmployeeCode)
	INSERT INTO messsages(Username,[Message])
	VALUES (@EmployeeCode,'')
	SET  @ResultValue = 1
END
-------------------------------------------------------------


--Stored Procedure to search an employee by an Admin

CREATE OR ALTER PROCEDURE spSearch
@SearchInput VARCHAR(20)
AS
BEGIN
	SELECT Employees.ID, Employees.EmployeeCode, Employees.Fname, Employees.Lname, Employees.City, Employees.Country, Employees.Username, Users.Pword, Employees.AGE, Employees.Activity, Employees.[Items Issued] FROM Employees 
	LEFT JOIN Users
	ON Employees.Username = Users.UserName
WHERE 
(
Employees.Username LIKE (@SearchInPut+'%')  
OR 
Employees.Fname LIKE (@SearchInPut+'%') 
OR 
Employees.City LIKE (@SearchInPut+'%')
)
END

----------------------------------------

CREATE OR ALTER PROCEDURE spIM
@username VARCHAR(20),
@message VARCHAR(255)
AS
BEGIN
	SELECT 1 FROM Employees WHERE Username = @username

	UPDATE messsages SET [Message] = @message WHERE Username = @username

END

EXEC spIM 'Mouse', 'Hello'

--Stored Procedure to show message to employee
CREATE OR ALTER PROCEDURE readIM
@username VARCHAR(20)
AS
BEGIN
	SELECT [Message] FROM messsages WHERE Username=@username
END

----------------------------------------

--Stored Procedure to broadcast message by Admin

CREATE OR ALTER PROCEDURE broadcast
@message VARCHAR(255)
AS
BEGIN
	UPDATE messsages SET [Message] = CONCAT([Message] ,' ', @message)
END
----------------------------------------

--Stored Procedure to show items borrowed by the employee
CREATE OR ALTER PROCEDURE spretItems
@username VARCHAR(20)
AS
BEGIN
	SELECT [Items Issued] FROM Employees WHERE Username = @username 
END
----------------------------------------

--Stored Procedure to update Employee
CREATE OR ALTER PROCEDURE spUpdateEmployee
@Username VARCHAR(20),
@FirstName VARCHAR(20),
@LastName VARCHAR(20),
@City VARCHAR(20),
@Age INT,
@COUNTRY VARCHAR(20),
@EmployeeCode INT
AS
BEGIN
DECLARE @CHECK INT 
IF((@Age >= 18) AND (@Age <= 60))
BEGIN
UPDATE Employees SET Fname = @FirstName, Lname = @LastName, City = @City,Country = @COUNTRY, Username = @Username, AGE=@Age WHERE EmployeeCode = @EmployeeCode 
UPDATE Users SET UserName = @Username WHERE EmployeeCode = @EmployeeCode
SET @CHECK = 1;
END
ELSE
BEGIN
SET @CHECK = 0;
END
END

EXECUTE spUpdateEmployee 'hassan.kamran',' ',' ',' ',' ',' ',8562
SELECT *FROM  Employees
---------------------------------------


CREATE OR ALTER PROCEDURE spClearmsg
@username VARCHAR(20)
AS
BEGIN
UPDATE messsages SET [Message] = '' WHERE Username = @username
END


select *from Employees