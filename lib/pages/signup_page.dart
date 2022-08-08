import 'package:flutter/material.dart';
import 'package:flutter_instaclone/pages/signin_page.dart';
class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
static const String id='signup_page';
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  _callSignInPage(){
    Navigator.pushNamed(context, SignInPage.id);
  }
  var fullNameController=TextEditingController();
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  var cpasswordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color.fromRGBO(193, 53, 132, 1),
                    Color.fromRGBO(131, 58, 180, 1),
                  ]),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Instagram',style: TextStyle(color: Colors.white,fontSize: 45,fontFamily: 'Billabong'),),
                      const  SizedBox(height: 20,),
                      Container(
                        height: 50,
                        margin:const EdgeInsets.only(left: 10,right: 10),
                        padding:const EdgeInsets.only(left: 10,right: 10),
                        decoration: BoxDecoration(
                          color: Colors.white54.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: TextField(
                          controller: fullNameController,
                          decoration:const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'FullName',

                            hintStyle: TextStyle(fontSize: 17),
                          ),
                        ),
                      ),
                      const  SizedBox(height: 10,),
                      Container(
                        height: 50,
                        margin:const EdgeInsets.only(left: 10,right: 10),
                        padding:const EdgeInsets.only(left: 10,right: 10),
                        decoration: BoxDecoration(
                          color: Colors.white54.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: TextField(
                          controller: emailController,
                          decoration:const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email',

                            hintStyle: TextStyle(fontSize: 17),
                          ),
                        ),
                      ),
                      const  SizedBox(height: 10,),
                      Container(
                        height: 50,
                        margin:const EdgeInsets.only(left: 10,right: 10),
                        padding:const EdgeInsets.only(left: 10,right: 10),
                        decoration: BoxDecoration(
                          color: Colors.white54.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: TextField(
                          controller: passwordController,
                          decoration:const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',

                            hintStyle: TextStyle(fontSize: 17),
                          ),
                        ),
                      ),
                      const  SizedBox(height: 10,),
                      Container(
                        height: 50,
                        margin:const EdgeInsets.only(left: 10,right: 10),
                        padding:const EdgeInsets.only(left: 10,right: 10),
                        decoration: BoxDecoration(
                          color: Colors.white54.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: TextField(
                          controller: cpasswordController,
                          decoration:const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Confirm password',

                            hintStyle: TextStyle(fontSize: 17),
                          ),
                        ),
                      ),
                      const  SizedBox(height: 50,),
                      Container(
                        height: 50,
                        margin:const EdgeInsets.only(left: 10,right: 10),
                        padding:const EdgeInsets.only(left: 10,right: 10),
                        decoration: BoxDecoration(
                          color: Colors.white54.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child:const Center(
                          child: Text('Sign In',style: TextStyle(color: Colors.white,fontSize: 16),),
                        ),
                      ),


                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account ?',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: _callSignInPage,
                      child: const Text(
                        'Sign In',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      );

  }
}
