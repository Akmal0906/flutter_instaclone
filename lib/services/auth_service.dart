import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instaclone/services/prefs_service.dart';

import '../pages/signin_page.dart';


class AuthService {
  static final auth = FirebaseAuth.instance;

  static Future<User?> signInUser(
      BuildContext context, String password, String email) async {
    try {
      auth.signInWithEmailAndPassword(email: email, password: password);
      final User user = auth.currentUser!;
      print('user result ${user.toString()}');
      return user;
    } catch (e) {
      print('e===$e');
    }
    return null;
  }

  static Future<Object?> signUpUser(
      BuildContext context, String name, String email, String password) async {
      Map<String,User?>map={};
    try {
      var authResult = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final User? user = authResult.user;
      map.addAll({'Success':user});
      print('user result ${user.toString()}');
      return user;
    } catch (error) {
      print('e=====$error');
      switch(error.hashCode.toString()){
        case 'Email already use':map.addAll({'Email already used it':null});
        break;
        default:map.addAll({'Error':null});

      }
    }
    return map;
  }

  static signOutUser(BuildContext context) {
    auth.signOut();
    Prefs().removeId().then((value) => Navigator.pushReplacementNamed(context, SignInPage.id),
       );
  }
}
