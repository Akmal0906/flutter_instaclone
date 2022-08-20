// @dart=2.9
import 'dart:io';

import 'package:hive/hive.dart';

import '../model/post_model.dart';

class HiveDB {
  var box = Hive.box('uic_database');

  void storeImage(final _image) {
    box.put('_image', _image);
  }

   loadImage() {
    final  _image = box.get('_image');
    return _image;
  }

  void removeImage() {
    box.delete('_image');
  }
}
