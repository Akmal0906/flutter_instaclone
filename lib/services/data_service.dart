// @dart=2.9

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_instaclone/model/user_model.dart';

import 'prefs_service.dart';

class DataService {
  static final _firestore = FirebaseFirestore.instance;
  static   final folder_users = 'users';

  static Future storeUser(Users user) async {
    user.id = await Prefs().getId();
    return _firestore.collection(folder_users).doc(user.id).set(user.toJson());
  }

  static Future<Users> loadUer() async {
    String id = await Prefs().getId();
    var value = await _firestore.collection('users').doc(id).get();
    Users user = Users.fromJson(value.data());
    return user;
  }

  static Future updateUser(Users user) async {
    String id = await Prefs().getId();
    return _firestore.collection(folder_users).doc(id).update(user.toJson());
  }

  static Future<List<Users>> serarchUsers(String keyword) async {
    List<Users> users = [];
    final instance = FirebaseFirestore.instance;
    var querySnapshot = await instance
        .collection('users')
        .orderBy('email')
        .startAt([keyword]).get();
    print(querySnapshot.docs.toString());
    querySnapshot.docs.forEach((result) {
      users.add(Users.fromJson(result.data()));
    });
  }
}
