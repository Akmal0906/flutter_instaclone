import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_instaclone/pages/main_page.dart';
import 'package:flutter_instaclone/pages/signin_page.dart';
class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);
static const String id='splash_page';
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  _initTimer(){
    Timer(const Duration(seconds: 3), () {
      _callSignInPage();
    });
  }
  _callSignInPage(){
    Navigator.pushReplacementNamed(context,MainPage.id);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initTimer();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration:const BoxDecoration(

          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomLeft,
            colors: [
               Color.fromRGBO(193, 53, 132,1),
               Color.fromRGBO(131, 58, 180,1),

            ]
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children:const [
Expanded(child: Center(
  child:             Text('Insatgram',style: TextStyle(color: Colors.white,fontSize: 34,fontFamily: 'Billabong'),),

)),
            Text('All right reversed',style: TextStyle(color: Colors.white,fontSize: 16),),
        SizedBox(height: 20,),
          ],
        ) ,
      ),
    );
  }
}
