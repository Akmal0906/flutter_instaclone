

class Users{
 late String id;
 final  String fullName;
final  String email;
final String password;
final String imageUrl;
bool follwed=false;
int followers_count=0;
int following_count=0;
 Users({required this.fullName,required this.email,required this.password,required this.id,required this.imageUrl});
 Users.fromJson(Map<String,dynamic>json):

      fullName=json['fullName'],
      id=json['id'],
      email=json['email'],
      imageUrl=json['imageUrl'],

 password=json['password'];
 Map<String,dynamic> toJson()=>{
  'fullName':fullName,
  'id':id,
  'email':email,
  'password':password,
  'imageUrl':imageUrl
 };
 @override
 bool operator==(other){
  return(other is Users)&&other.id==id;
 }

  @override
  int get hashCode => super.hashCode;




}