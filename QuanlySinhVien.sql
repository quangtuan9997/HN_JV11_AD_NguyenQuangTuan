create database Test2;
use Test2;
create table Subjects(
SubjectID int(4) primary key ,
SubjectName nvarchar(50)
);
create table Student(
StudentID int(4) primary key,
StudentName nvarchar(50),
Age int(4),
Email varchar(100)
);
create table Classes(
ClassID int(4) primary key,
ClassName nvarchar(50)
);
create table Marks(
mark int,
SubjectID int,
StudentID int,
foreign key (SubjectID) references Subjects(SubjectID),
foreign key (StudentID) references Student(StudentID)
);
create table ClassStudent (
StudentID int,
ClassID int,
foreign key (StudentID) references Student(StudentID),
foreign key (ClassID) references Classes(ClassID)
);
insert into Student values
(1,"Nguyen Quang An",18,"an@yahoo.com"),
(2,"Nguyen Cong Vinh",20,"vinh@gmail.com"),
(3,"Nguyen Van Quyen",19,"quyen"),
(4,"Pham Thanh Binh",25,"binh@com"),
(5,"Nguyen Van Tai Em",30,"taiem@sport.vn");
insert into Classes values 
(1,"C0706L"),
(2,"C0708G");
insert into ClassStudent values
(1,1),
(2,1),
(3,2),
(4,2),
(5,2);
insert into Subjects values
(1,"SQL"),
(2,"Java"),
(3,"C"),
(4,"Visual Basic");
insert into Marks values
(8,1,1),
(4,2,1),
(9,1,1),
(7,1,3),
(3,1,4),
(5,2,5),
(8,3,3),
(1,3,5),
(3,2,4);
-- 1 Hien thi danh sach tat ca cac hoc vien
select * from Student;
-- 2 hien thi danh sach tat ca cac mon hoc
select * from Subjects;
-- 3. tinh diem trung binh;
select avg(mark) as `diem trung binh`  from Marks ;
-- 4.hien thi mon hoc nao co hoc sinh thi duoc diem cao nhat
select sb.SubjectName, m.Mark from Subjects sb
join Marks m on m.SubjectId=sb.SubjectId
 where m.Mark=(select max(mark) from marks);
-- 5.danh so thu tu cua diem thi theo chieu giam
select (@stt:=@stt+1) as `STT` ,m.* from (select @stt:=0) r, Marks m order by mark desc ;
-- 6. thay doi kieu du lieu cua cot SubjectName -->> nvarchar(max)
alter table Subjects modify SubjectName nvarchar(255);
-- 7 cap nhap them dong chu <<Day la mon hoc >> vao truoc ban ghi
update Subjects set SubjectName= concat("Day la mon hoc ", SubjectName);
-- 8 viet Check Constraint de kiem tra do tuoi nhap vao
alter table Student add constraint Age check(Age>15 and Age<50);
-- 9 loai bo tat cac quan he giua cac bang
alter table Marks drop foreign key marks_ibfk_1;
alter table Marks drop foreign key marks_ibfk_2;
alter table ClassStudent drop foreign key classstudent_ibfk_1;
alter table ClassStudent drop foreign key classstudent_ibfk_2;
-- 10. xoa hoc vien co StudentId=1
delete from Student where StudentId=1;
-- 11. tao them cot Status 
alter table Student add `Status` bit default(1);
-- 12 cap nhap gia trij Status thanh 0
update Student set `Status`=1;