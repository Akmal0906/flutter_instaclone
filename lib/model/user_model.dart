class Users{
 final String id;
 final  String name;
final  String email;
final String password;
final String cpassword;
 Users({required this.name,required this.email,required this.password,required this.id,required this.cpassword});
 Users.fromJson(Map<String,dynamic>json):

      name=json['name'],
      id=json['id'],
      email=json['email'],
      cpassword=json['cpassword'],

 password=json['password'];
 Map<String,dynamic> toJson()=>{
  'name':name,
  'id':id,
  'email':email,
  'password':password,
  'cpassword':cpassword
 };
}