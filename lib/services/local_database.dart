import 'package:hive/hive.dart';

import '../model/post_model.dart';

class HiveDB{
  var box=Hive.box('uic_database');
  void storePost(Post post){
    box.put('post',post);
  }
  Post loadPost(){
    var post=Post.fromJson(box.get('post'));
    return post;
  }
  void removePost(){
    box.delete('post');
  }
}