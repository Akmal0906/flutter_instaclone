// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_instaclone/bloc/content_bloc.dart';
import 'package:flutter_instaclone/pages/home_page.dart';
import 'package:flutter_instaclone/pages/signin_page.dart';
import 'package:flutter_instaclone/pages/signup_page.dart';
import 'package:flutter_instaclone/pages/splash_page.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main()async {

  //await Hive.box('uic_database');
  runApp(const MyApp());
 // Hive.initFlutter();
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContentBloc()..add(GetPosts()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: const SplashPage(),
        routes: {
          HomePage.id: (context) => const HomePage(),
          SignInPage.id: (context) => const SignInPage(),
          SignUpPage.id: (context) => const SignUpPage(),
          SplashPage.id: (context) => const SplashPage(),
        },
      ),
    );
  }
}

