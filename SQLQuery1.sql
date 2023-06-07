
/*create database*/
create database Bookstore;

use Bookstore;


/*create tables Authors and Books*/
create table Authors(
 AuthorID int primary key,
 FirstName varchar(255),
 LastName varchar (255)
);

create table Books(
  BookID INT PRIMARY KEY,
  Title varchar(255),
  AuthorID int ,
  Foreign Key (AuthorID) references Authors(AuthorID)
);


/*Insert values into the data*/
insert into Authors(AuthorID,FirstName,LastName)Values
( 1,'John', 'Doe'),
(2,  'Jane',  'Smith'),
(3,  'David',  'Johnson');



insert into Books(BookID,Title,AuthorID)Values
( 1,'Book1', 1),
(2,  'Book2',  2),
(3,  'Book3',  3);

/*Retrieve book2*/
select* from Books
where Title = 'Book2';

/*Update author's last name to smithson*/
update Authors
set LastName = 'Smithson' 
where AuthorID in
(
 select AuthorID from Books
 where BookID =1
 )

 /*Delete author with the authourid 3*/
 delete from Authors 
 where AuthorID =3;

delete from Books 
 where AuthorID =3;

 select* from Books; /* confirmation of delete*/

 /*Count of Books*/
 select count (BookID) from Books

 /*show all books along with their authors*/
 select BookID,Title,mk.AuthorID,FirstName,LastName
 from Books mk
 inner join
 Authors aut
 on mk.AuthorID = aut.AuthorID

