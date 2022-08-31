// @dart=2.9
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_instaclone/bloc/content_bloc.dart';
import 'package:flutter_instaclone/model/post_model.dart';
import 'package:flutter_instaclone/pages/my_feed_page.dart';
import 'package:flutter_instaclone/services/local_database.dart';
import 'package:image_picker/image_picker.dart';

class MyUploadPage extends StatefulWidget {
  PageController pageController;

  MyUploadPage([this.pageController]);

  static const String id = 'myupload_page';

  @override
  State<MyUploadPage> createState() => _MyUploadPageState();
}

class _MyUploadPageState extends State<MyUploadPage> {
  File _image;

  _imgFromGallery() async {
    XFile image = await ImagePicker().pickImage(
        source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = File(image.path);
    });
  }

  _imgFromCamera() async {
    XFile image = await ImagePicker().pickImage(
        source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _image = File(image.path);
    });
  }

  Future _uploadNewPost() async {
    String caption = captionController.text.toString().trim();

    if (caption != '' && _image != null) {
      setState(() {
        print("path ${_image.path}");  
        Post post = Post(postImage: _image.path, postCaption: caption);
        HiveDB().storeImage(_image.path);
        context.read<ContentBloc>().add(AddPostEvent(post));
      });

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MyFeedPage(widget.pageController, true)));
      // widget.pageController.animateToPage(0,
      //  duration: const Duration(milliseconds: 100), curve: Curves.easeIn);
      //}
      // );
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    HiveDB().removeImage();
  }

  var captionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Upload',
          style: TextStyle(
              fontFamily: 'Billabong',
              fontSize: 28,
              color: Colors.black,
              letterSpacing: 1,
              textBaseline: TextBaseline.alphabetic),
        ),
        actions: [
          IconButton(
              onPressed: () {
                _uploadNewPost();
              },
              icon: const Icon(
                Icons.post_add,
                color: Color.fromARGB(245, 96, 64, 1),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext bc) {
                        return SafeArea(
                          child: Container(
                            child: Wrap(
                              children: <Widget>[
                                ListTile(
                                    leading: const Icon(Icons.photo_library),
                                    title: const Text('Photo Library'),
                                    onTap: () {
                                      _imgFromGallery();
                                      Navigator.of(context).pop();
                                    }),
                                ListTile(
                                  leading: const Icon(Icons.photo_camera),
                                  title: const Text('Camera'),
                                  onTap: () {
                                    _imgFromCamera();
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: Container(
                  color: Colors.grey.withOpacity(0.2),
                  height: MediaQuery.of(context).size.width,
                  width: double.infinity,
                  child: _image == null
                      ? const Center(
                          child: Icon(
                            Icons.add_a_photo_outlined,
                            color: Colors.grey,
                            size: 45,
                          ),
                        )
                      : Stack(
                          children: [
                            ClipRRect(
                              child: Image.file(
                                _image,
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Container(
                              color: Colors.black12,
                              width: double.infinity,
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  IconButton(
                                    color: Colors.black,
                                    icon: const Icon(Icons.highlight_remove),
                                    onPressed: () {
                                      setState(() {
                                        _image = null;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: TextField(
                  controller: captionController,
                  maxLines: 5,
                  minLines: 1,
                  style: const TextStyle(color: Colors.deepPurpleAccent),
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                      hintText: 'Caption',
                      hintStyle: TextStyle(fontSize: 17, color: Colors.black)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
