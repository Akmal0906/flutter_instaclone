import 'package:flutter/material.dart';
import 'package:flutter_instaclone/pages/home_page.dart';
import 'package:flutter_instaclone/pages/signup_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);
  static const String id = 'signin_page';

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  _callSignUpPage(){
    Navigator.pushNamed(context, SignUpPage.id);
  }
  _callHomePage(){
    Navigator.pushReplacementNamed(context, HomePage.id);
  }
  var emailController=TextEditingController();
  var passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                  const  SizedBox(height: 50,),
                  GestureDetector(
                    onTap: _callHomePage,
                    child: Container(
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
                  ),


                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don not have account ?',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: _callSignUpPage,
                  child: const Text(
                    'Sign Up',
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
    );
  }
}
