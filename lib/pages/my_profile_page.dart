// @dart=2.9
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

import '../model/post_model.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({Key key}) : super(key: key);
  static const String id = 'myprofile_page';

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  List<Post> items = [];
  File _image;

  _imgFromGallery() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  _imgFromCamera() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  String post_im1 =
      'https://firebasestorage.googleapis.com/v0/b/koreanguideway.appspot.com/o/develop%2Fpost.png?alt=media&token=f0b1ba56-4bf4-4df2-9f43-6b8665cdc964';
  String post_im2 =
      'https://firebasestorage.googleapis.com/v0/b/koreanguideway.appspot.com/o/develop%2Fpost2.png?alt=media&token=ac0c131a-4e9e-40c0-a75a-88e586b28b72';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    items.add(Post(postImage: post_im1, postCaption: 'This is post caption'));
    items.add(Post(postImage: post_im2, postCaption: 'This is post caption'));
  }
  var _selectedCount=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            'Profile',
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontFamily: 'Billabong'),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(70),
                        border: Border.all(
                            color: Colors.deepPurpleAccent, width: 1.5)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(35),
                      child: _image == null
                          ? const Image(
                              image: AssetImage('assets/images/ic_person.png'),
                              height: 70,
                              width: 70,
                            )
                          : Image.file(
                              _image,
                              fit: BoxFit.cover,
                              height: 70,
                              width: 70,
                            ),
                    ),
                  ),
                  SizedBox(
                    height: 90,
                    width: 90,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.add_circle,
                            color: Colors.deepPurple,
                          ),
                          onPressed: () {
                            _showBottomSheet();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Akmaljon',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 3,
              ),
              const Text(
                'akmal@gmail.com',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 80,
                child: Row(
                  children: [
                    Expanded(
                        child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            '675',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            'Post',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    )),
                    Expanded(
                        child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            '123.5',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            'Follwers',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    )),
                    Container(
                      width: 1,
                      height: 20,
                      color: Colors.grey.withOpacity(0.2),
                    ),
                    Expanded(
                        child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            '589',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            'Following',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    )),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                height: 40,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){
                      setState(() {
                        _selectedCount=2;
                      });
                    }, icon: Icon(Icons.account_balance)),
                    IconButton(onPressed: (){
                      setState(() {
                        _selectedCount=1;
                      });
                    }, icon: Icon(Icons.account_balance_wallet)),
                  ],
                ),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: _selectedCount),
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) =>
                      _itemOfPost(items[index]),
                ),
              ),
            ],
          ),
        ));
  }

  _showBottomSheet() {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: const Text("Gallery"),
                leading: IconButton(
                    onPressed: () {
                      _imgFromGallery();
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.image)),
              ),
              ListTile(
                title: const Text("Camera"),
                leading: IconButton(
                  icon: const Icon(Icons.camera),
                  onPressed: () {
                    _imgFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              )
            ],
          );
        });
  }

  Widget _itemOfPost(Post post) {
    return Container(
        height: 30,
        // margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        child: CachedNetworkImage(
          imageUrl: post.postImage,
          width: double.infinity,
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          fit: BoxFit.cover,
        ));
  }
}
