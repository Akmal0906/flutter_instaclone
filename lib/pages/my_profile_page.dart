import 'package:flutter/material.dart';
class MyProfilePage extends StatefulWidget {
  const MyProfilePage({Key? key}) : super(key: key);
static const String id='myprofile_page';
  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Profile'),
      ),
    );
  }
}
