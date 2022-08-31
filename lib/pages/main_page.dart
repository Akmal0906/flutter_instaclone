import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_instaclone/pages/home_page.dart';
import 'package:flutter_instaclone/pages/signin_page.dart';
class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);
static const String id='main_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context,snapshot){
          if(snapshot.hasData){
            return  const HomePage();
          }else{
            return const SignInPage();
          }
          }
      ),
    );
  }
}
