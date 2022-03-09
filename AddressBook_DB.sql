----Creating data base UC1----
create database AddressBookService;

use AddressBookService;
----- Creating Table UC2-----
CREATE TABLE addressbook(
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    address varchar(100) not null,
    city varchar(20) not null,
    state varchar(20)not null,
    zip int not null,
    phone_no varchar(15) not null,
    email_id varchar(50) not null,
	);

	----- Inserting Data UC3----
	insert into addressbook (first_name,last_name,address,city,state,zip,phone_no,email_id)
    values('Mahesh','Gite','Ramnagar','Nasik','Maharashtra','123478','4565455854','Mahesh@gmail.com'),
        ('Omkar','Bade','Bhagwan nagar','Mumbai','Maharashtra','224562','4561237854','omii@gmail.com'),
		('Aakash','Khare','Great india street','Jamshedpur','Odisha','229512','4561654874','aaksh@gmail.com'),
		('Rahul','Kote','Army nagar','Pune','Maharastra','229545','7410412654','kote@gmail.com'),
		('Bablu','sharma','Kali chowki','Jabalpur','UP','224512','74106548456','Bablu@gmail.com');
		select * from addressbook;

		-------Edit Contact UC4-----
		update addressbook set zip=969381  where first_name='Mahesh' and last_name='Gite';

		-------Delete Contact UC5----
	delete from addressbook where first_name='Mahesh' and last_name='Gite';
	select * from addressbook;

	-------Retrieve person from city or state name UC6-------
	select first_name,last_name from addressbook  where city='Mumbai' or  state='Maharashtra';
	select * from addressbook;

	------Count of addressbook by city and state UC7--------
	select count(city) as count_of_address_book from addressbook where city='Mumbai' and state='Maharashtra';
	
------Retreive data alphabetically by name from city UC8-------
	select * from addressbook ORDER BY first_name 

	-------Alter table UC 9--------
	alter table AddressBook add AddBookName varchar(50), BookType varchar(50);

	 update addressbook set AddBookName='Book1', BookType='Family' where last_name='Bade'; 
	update addressbook set AddBookName='Book2', BookType='Close_Friends' where first_name='Aakash' or first_name='Omkar';
	update addressbook set AddBookName='Book3', BookType='Work' where first_name='Rahul';
	update addressbook set AddBookName='Book3', BookType='Work' where first_name='Bablu';
	select * from addressbook;

	--------Count by BookType UC 10-------
	 select count(first_name) as Contacts from addressbook where BookType='Work';
	
	--------Adding person details in family and close friends columns UC11------
	 insert into addressbook values('Sandesh','Jawle','5/415','Hydrabad','Telangana','778941','1593574562','Jawle@gmail.com','Book1','Family'),
	('Sandesh','Jawle','5/415','Hydrabad','Telangana','778941','1593574562','Jawle@gmail.com','Book2','Closed_Friends');
	select * from addressbook;

	------- ER Diagram UC 12----------
	---droping table----
	drop table addressbook;


	-----Creating new table----------
	create table addbooknametype(
    book_id varchar(50) not null PRIMARY KEY,
    book_name varchar(50) not null,
    book_type varchar(50) not null
	);

	CREATE TABLE contact(
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    address varchar(100) not null,
    city varchar(20) not null,
    state varchar(20)not null,
    zip int not null,
    phone_no varchar(15) not null,
    email_id varchar(50) not null,
	book_id varchar(50) foreign key references addbooknametype(book_id)
	);

	-----Inserting Data-----
	insert into addbooknametype(book_id,book_name,book_type)values('1','Book1','Family'),('2','Book2','Close_Friends'),('3','Book3','Work');
	select * from addbooknametype;

	insert into contact (first_name,last_name,address,city,state,zip,phone_no,email_id,book_id)
    values('Mahesh','Gite','Ramnagar','Nasik','Maharashtra','123478','4565455854','Mahesh@gmail.com',1),
        ('Omkar','Bade','Bhagwan nagar','Mumbai','Maharashtra','224562','4561237854','omii@gmail.com',1),
		('Aakash','Khare','Great india street','Jamshedpur','Odisha','229512','4561654874','aaksh@gmail.com',3),
		('Rahul','Kote','Army nagar','Pune','Maharastra','229545','7410412654','kote@gmail.com',2),
		('Bablu','sharma','Kali chowki','Jabalpur','UP','224512','74106548456','Bablu@gmail.com',3),
		('Sandesh','Jawle','5/415','Hydrabad','Telangana','778941','1593574562','Jawle@gmail.com',2);
	select * from contact;


	------Checking queries UC13-------
	select first_name, last_name from contact c inner join addbooknametype a on c.book_id=a.book_id 
    where c.city='Mumbai' or c.state='Maharashtra';

	select count (c.first_name) as Total_Count,c.city from contact c inner join addbooknametype a on c.book_id=a.book_id 
    group by c.city;

	select first_name, last_name from contact c inner join addbooknametype a on c.book_id=a.book_id  where c.city='Nasik'
    order by first_name DESC;

	select a.book_type as Book_Type, COUNT(a.book_type) as Total_Count from contact c inner join addbooknametype a on c.book_id=a.book_id 
    group by a.book_type;