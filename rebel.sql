create table rebel_branch
(
	id int identity(1,1),
	addr varchar(100),
	city varchar(100),
	pincode varchar(100),
	latitude varchar(100),
	longitude varchar(100),
	mobileno varchar(100),
	emailid varchar(100),
	branchpass varchar(100),
	opening varchar(200)
	
)

create proc		sp_list_city
(
	@addr varchar(100),
	@city varchar(100),
	@pincode varchar(100),
	@latitude varchar(100),
	@longitude varchar(100),
	@mobileno varchar(100),
	@emailid varchar(100),
	@branchpass varchar(100),
	@opening varchar(200)
)
as begin
	insert into rebel_branch(addr,city,pincode,latitude,longitude,mobileno,emailid,branchpass,opening) values(@addr,@city,@pincode,@latitude,@longitude,@mobileno,@emailid,@branchpass,@opening)
end

INSERT INTO rebel_branch (addr, city, pincode, latitude, longitude, mobileno, emailid, branchpass, opening) 
VALUES 
('123 Main Street', 'New York', '10001', '40.7128', '-74.0060', '1234567890', 'branch1@example.com', 'password1', 'Mon-Fri: 9:00 AM - 5:00 PM'),
('456 Elm Street', 'Los Angeles', '90001', '34.0522', '-118.2437', '9876543210', 'branch2@example.com', 'password2', 'Mon-Fri: 8:00 AM - 6:00 PM'),
('789 Oak Street', 'Chicago', '60601', '41.8781', '-87.6298', '5556667777', 'branch3@example.com', 'password3', 'Mon-Fri: 10:00 AM - 4:00 PM'),
('101 Pine Street', 'San Francisco', '94101', '37.7749', '-122.4194', '9998887777', 'branch4@example.com', 'password4', 'Mon-Fri: 8:30 AM - 4:30 PM'),
('202 Maple Street', 'Houston', '77001', '29.7604', '-95.3698', '1112223333', 'branch5@example.com', 'password5', 'Mon-Fri: 9:30 AM - 5:30 PM');


create proc sp_list_city
as begin
select city from rebel_branch
end

select * from rebel_branch

create table delivery_person
(
id int identity(1,1),
personname varchar(100),
phoneno varchar(100),
addr varchar(100),
vehicletype varchar(100),
licenceplate varchar(100),
workinghours varchar(100),

)

ALTER TABLE delivery_person
ADD branch varchar(100);

ALTER TABLE delivery_person
ADD pass varchar(100);

alter proc sp_delivery_person
(
	@personname varchar(100),
	@phoneno varchar(100),
	@addr varchar(100),
	@vehicletype varchar(100),
	@licenceplate varchar(100),
	@workinghours varchar(100),
	@password varchar(100),
	@branch varchar(100)
)
as begin
insert into delivery_person (personname, phoneno, addr, vehicletype, licenceplate, workinghours,pass,branch)
    VALUES (@personname, @phoneno, @addr, @vehicletype, @licenceplate, @workinghours,@password,@branch);
end

update delivery_person set branch='New York' where personname='delivery'

select * from delivery_person

create proc display_delivery
(
@city varchar(100),
@branchpass varchar(100)
)
as begin
select city from rebel_branch where city=@city and branchpass=@branchpass
end

create proc delivery_person_login
(
@branch varchar(100),
@personname varchar(100),
@pass varchar(100)
)
as begin
select branch,personname from delivery_person where branch=@branch and personname=@personname and pass=@pass
end


create table chef_add
(
id int identity(1,1),
branch varchar(100),
chefname varchar(100),
phoneno varchar(100),
street varchar(100),
city varchar(100),
pincode varchar(100),
specilties varchar(100),
workinghours varchar(100)

)

create proc sp_add_chef
(
@branch varchar(100),
@chefname varchar(100),
@phoneno varchar(100),
@street varchar(100),
@city varchar(100),
@pincode varchar(100),
@specilties varchar(100),
@workinghours varchar(100)
)
as begin
insert into chef_add (branch, chefname, phoneno, street, city, pincode, specilties, workinghours)
    values (@branch, @chefname, @phoneno, @street, @city, @pincode, @specilties, @workinghours);

end