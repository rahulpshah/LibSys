# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
 


 Admin.create(name:"admin",email:"admin@admin.com",password:"admin123");
 Member.create(name:"rahul",email:"rahul@rahul.com",password:"rahul123");
 Member.create(name:"hriti",email:"hriti@hriti.com",password:"hriti123");
 Book.create(isbn:"123",name:"clrs",authors:"abc,bcd,cde,def",description:"asdasda");
 Book.create(isbn:"1231",name:"clrs1",authors:"abc,bcd,cde,def",description:"asdasda");
 Book.create(isbn:"1232",name:"clrs2",authors:"abc,bcd,cde,def",description:"asdasda");
 Book.create(isbn:"1233",name:"clrs3",authors:"abc,bcd,cde,def",description:"asdasda");
 
