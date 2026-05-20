CREATE DATABASE library_db;
USE library_db;

-- create table "Branch"
CREATE table Branch(
     Branch_no VARCHAR(10) PRIMARY KEY,
     Manager_id VARCHAR(10),
	 Branch_address VARCHAR (20),
     Contact_no INT
);
SELECT * FROM Branch;
ALTER TABLE Branch MODIFY Contact_no VARCHAR(15);

-- create table "Employee"
CREATE table Employee(
	 Emp_id VARCHAR(10) PRIMARY KEY,
     Emp_name VARCHAR(30),
     Position VARCHAR(20),
	 Salary FLOAT,
     branch_no VARCHAR(10)
);
ALTER TABLE Employee MODIFY Salary DECIMAL(10,2);
ALTER TABLE Employee ADD FOREIGN KEY (branch_no) REFERENCES Branch(Branch_no) 
on delete cascade
on update cascade;
SELECT * FROM Employee;

-- create table "Customer"
CREATE table Customer(
	 Customer_Id VARCHAR(10) PRIMARY KEY,
     Customer_name VARCHAR(30),
     Customer_address VARCHAR(30),
	 Reg_date DATE
);

-- create table "Books"
CREATE table Books(
	 ISBN VARCHAR(30) PRIMARY KEY,
     Book_title VARCHAR(70),
     Category VARCHAR(20),
	 Rental_Price FLOAT,
     Status ENUM('YES','NO'),
     Author VARCHAR(20),
	 Publisher VARCHAR(20)
);
ALTER TABLE Books MODIFY Author VARCHAR(30);
ALTER TABLE Books MODIFY Publisher VARCHAR(30);

-- create table "Issue_Status"
CREATE table Issue_Status(
	 Issue_Id VARCHAR(10) PRIMARY KEY,
     Issued_cust VARCHAR(10),
     Issued_book_name VARCHAR(70),
	 Issue_date DATE,
     Isbn_book VARCHAR(20),
     FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id)
     ON DELETE CASCADE
     ON UPDATE CASCADE,
     FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
     ON DELETE CASCADE
     ON UPDATE CASCADE
);

-- create table "Return_Status"
CREATE table Return_Status(
	 Return_id VARCHAR(10) PRIMARY KEY,
     Return_cust VARCHAR(10),
     Return_book_name VARCHAR(70),
	 Return_date DATE,
     isbn_book2 VARCHAR(20),
     FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id)
     ON DELETE CASCADE
     ON UPDATE CASCADE,
     FOREIGN KEY (isbn_book2) REFERENCES Books(ISBN)
     ON DELETE CASCADE
     ON UPDATE CASCADE
);

SHOW TABLES;

-- Insert values into all tables
INSERT INTO Customer
(Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES
('C101', 'Alice Johnson', '123 Main St', '2021-05-15'),
('C102', 'Bob Smith', '456 Elm St', '2021-06-20'),
('C103', 'Carol Davis', '789 Oak St', '2021-07-10'),
('C104', 'Dave Wilson', '567 Pine St', '2021-08-05'),
('C105', 'Eve Brown', '890 Maple St', '2021-09-25'),
('C106', 'Frank Thomas', '234 Cedar St', '2021-10-15'),
('C107', 'Grace Taylor', '345 Walnut St', '2021-11-20'),
('C108', 'Henry Anderson', '456 Birch St', '2021-12-10'),
('C109', 'Ivy Martinez', '567 Oak St', '2022-01-05'),
('C110', 'Jack Wilson', '678 Pine St', '2022-02-25');

SELECT * FROM Customer;

INSERT INTO Branch
(Branch_no, Manager_id, Branch_address, Contact_no)
VALUES
('B001', 'M101', '123 Main St', '+919099988676'),
('B002', 'M102', '456 Elm St', '+919099988677'),
('B003', 'M103', '789 Oak St', '+919099988678'),
('B004', 'M104', '567 Pine St', '+919099988679'),
('B005', 'M105', '890 Maple St', '+919099988680');

SELECT * FROM Branch;

INSERT INTO Employee
(Emp_id, Emp_name, Position, Salary, branch_no)
VALUES
('E101', 'John Doe', 'Manager', '60000', 'B001'),
('E102', 'Jane Smith', 'Clerk', '45000', 'B001'),
('E103', 'Mike Johnson', 'Librarian', '55000', 'B001'),
('E104', 'Emily Davis', 'Assistant', '40000', 'B001'),
('E105', 'Sarah Brown', 'Assistant', '42000', 'B002'),
('E106', 'Michelle Ramirez', 'Assistant', '43000', 'B003'),
('E107', 'Michael Thompson', 'Manager', '62000', 'B002'),
('E108', 'Jessica Taylor', 'Clerk', '46000', 'B002'),
('E109', 'Daniel Anderson', 'Librarian', '57000', 'B002'),
('E1010', 'Laura Martinez', 'Assistant', '41000', 'B004'),
('E111', 'Christopher Lee', 'Manager', '65000', 'B003');

SELECT * FROM Employee;

INSERT INTO Books
(ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES
('978-0-09-957807-9', 'A Game of Thrones', 'Fantasy', '7.5', 'Yes', 'George R.R. Martin', 'Bantam'),
('978-0-14-044930-3', 'The Histories', 'History', '5.5', 'Yes', 'Herodotus', 'Penguin Classics'),
('978-0-14-118776-1', 'One Hundred Years of Solitude', 'Literary Fiction', '6.5', 'Yes', 'Gabriel Garcia Marquez', 'Penguin Books'),
('978-0-141-44171-6', 'Jane Eyre', 'Classic', '4', 'NO', 'Charlotte Bronte', 'Penguin Classics'),
('978-0-19-280551-1', 'The Guns of August', 'History', '7', 'Yes', 'Barbara W. Tuchman', 'Oxford University Press'),
('978-0-307-37840-1', 'The Alchemist', 'Fiction', '2.5', 'Yes', 'Paulo Coelho', 'HarperOne'),
('978-0-307-58837-1', 'Sapiens: A Brief History of Humankind', 'History', '8', 'NO', 'Yuval Noah Harari', 'Harper Perennial'),
('978-0-330-25864-8', 'Animal Farm', 'Classic', '5.5', 'Yes', 'George Orwell', 'Penguin Books'),
('978-0-375-41398-8', 'The Diary of a Young Girl', 'History', '6.5', 'Yes', 'Anne Frank', 'Bantam'),
('978-0-393-05081-8', "A People' History of the United States", 'History', '9', 'Yes', 'Howard Zinn', 'Harper Perennial'),
('978-0-393-91257-8', 'Guns, Germs, and Steel: The Fates of Human Societies', 'History', '7', 'Yes', 'Jared Diamond', 'W. W. Norton & Company'),
('978-0-525-47535-5',  'The Great Gatsby', 'Classic', '8', 'Yes', 'F. Scott Fitzgerald', 'Scribner'),
('978-0-553-29698-2', 'The Catcher in the Rye', 'Classic', '7', 'Yes', 'J.D. Salinger', 'Little, Brown and Company'),
('978-0-679-76489-8', "Harry Potter and the Sorcerer's Stone", 'Fantasy', '7', 'Yes', 'J.K. Rowling', 'Scholastic'),
('978-0-7432-4722-4', 'The Da Vinci Code', 'Mystery', '8', 'Yes', 'Dan Brown', 'Doubleday'),
('978-0-7432-7357-1', '1491: New Revelations of the Americas Before Columbus', 'History', '6.5', 'NO', 'Charles C. Mann', 'Vintage Books');

SELECT * FROM Books;

INSERT INTO Issue_Status
(Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES
('IS101', 'C101', 'The Catcher in the Rye', '2023-05-01', '978-0-553-29698-2'),
('IS102', 'C102', 'The Da Vinci Code', '2023-05-02', '978-0-7432-4722-4'),
('IS103', 'C103', '1491: New Revelations of the Americas Before Columbus', '2023-05-03', '978-0-7432-7357-1'),
('IS104', 'C104', 'Sapiens: A Brief History of Humankind', '2023-05-04', '978-0-307-58837-1'),
('IS105', 'C105', 'The Diary of a Young Girl', '2023-05-05', '978-0-375-41398-8');

SELECT * FROM Issue_Status;

INSERT INTO Return_Status
(Return_id, Return_cust, Return_book_name, Return_date, isbn_book2)
VALUE
('RS101', 'C101', 'The Catcher in the Rye', '2023-06-06', '978-0-553-29698-2'),
('RS102', 'C102', 'The Da Vinci Code', '2023-06-07', '978-0-7432-4722-4'),
('RS103', 'C105', 'The Diary of a Young Girl', '2023-06-08', '978-0-375-41398-8'),
('RS104', 'C108', 'The Histories', '2023-06-09', '978-0-14-044930-3'),
('RS105', 'C110', 'A Game of Thrones', '2023-06-10', '978-0-09-957807-9');

SELECT * FROM Return_Status;
select*from books;
  -- queries
 -- 1.Retrieve the book title, category, and rental price of all available books.
 select*from books;
  select Book_title,Category, Rental_Price from Books where status="yes";
  
  -- 2.List the employee names and their respective salaries in descending order of salary.
  select *from employee;
  select Emp_name,salary from employee order by salary desc;
  
-- 3.Retrieve the book titles and the corresponding customers who have issued those books. 
show tables;
select*from issue_status;
select Issued_book_name,Issued_cust from issue_status;

-- 4.Display the total count of books in each category. 
select *from books;
select category,count(*) as total_count_of_Books from books group by category;

-- 5.Retrieve the employee names and their positions for the employees whose salaries are above 50,000.
select*from employee;
select emp_name, position from employee where salary>50000;

-- 6.List the customer names who registered before 2022-01-01 and have not issued any books yet. 
select*from customer;
select Customer_name from customer where Reg_Date < '2022-01-01' and customer_id not in (select issued_cust from issue_status);

-- 7.Display the branch numbers and the total count of employees in each branch.
select*from employee;
select branch_no,COUNT(*) as total_count_of_employee from employee group by branch_no;

-- 8.Display the names of customers who have issued books in the month of June 2023. 
select*from issue_status;
SELECT customer.customer_name
FROM customer
INNER JOIN issue_status
    ON customer.Customer_Id = issue_status.issued_cust
    where issue_status.Issue_date between  '2023-06-01' and '2023-06-30';
    
-- 9. .Retrieve book titles from the book table containing the category "history".
select * from books;
select book_title from books where category = 'history';

-- 10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
show tables;
select*from branch;
select branch_no , count(*) as count_of_employees from branch group by branch_no having count_of_employees>5;

