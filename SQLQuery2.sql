create database imgupload


create table img
(
 id int identity(1,1),
 name varchar(100)
)

alter procedure sp_img
(
	@name varchar(100),
	@imageUpload VARBINARY(MAX)
)
as begin 
	insert into img(name,imageUpload) values(@name,@imageUpload)
end


create procedure sp_update
(
	@name varchar(100),
	@imageUpload VARBINARY(MAX)
)
as begin 
	update img set name=@name,imageUpload=@imageUpload where id=1
end


ALTER TABLE img
ADD imageUpload VARBINARY(MAX);

exec sp_img 'king'

select * from img