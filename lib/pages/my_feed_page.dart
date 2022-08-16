import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_instaclone/bloc/content_bloc.dart';
import '../model/post_model.dart';

class MyFeedPage extends StatefulWidget {
  PageController? pageController;
  bool? addPost;

  MyFeedPage([this.pageController,this.addPost]);

  @override
  State<MyFeedPage> createState() => _MyFeedPageState();
}

class _MyFeedPageState extends State<MyFeedPage> {
  List<Post> items = [];
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Instagram',
          style: TextStyle(
              color: Colors.black, fontFamily: 'Billabong', fontSize: 30),
        ),
        actions: [
          IconButton(
              onPressed: () {
                widget.pageController!.animateToPage(2,
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.easeIn);
              },
              icon: const Icon(
                Icons.camera_alt,
                color: Colors.black,
              )),
        ],
      ),
      body: BlocBuilder<ContentBloc, ContentState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.posts.length,
            itemBuilder: (BuildContext context, int index) {
              return _itemOfPost(state.posts[index]);
            },
          );
        },
      ),
    );
  }

  Widget _itemOfPost(Post post) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const Divider(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: const Image(
                        image: AssetImage('assets/images/ic_person.png'),
                        height: 40,
                        width: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'UserName',
                          style:
                              TextStyle(color: Colors.black, letterSpacing: 1),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'February 2,2022',
                          style:
                              TextStyle(color: Colors.black, letterSpacing: 1),
                        )
                      ],
                    )
                  ],
                ),
                IconButton(
                    onPressed: () {}, icon: const Icon(SimpleLineIcons.options))
              ],
            ),
          ),
          // Image.network(post.postImage,fit: BoxFit.fill,),
          CachedNetworkImage(
            imageUrl: post.postImage,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          //  CachedNetworkImage(
          //    imageUrl:post.postImage,
          //    progressIndicatorBuilder: (context, url, downloadProgress) =>
          //        CircularProgressIndicator(value: downloadProgress.progress),
          //    errorWidget: (context, url, error) => Icon(Icons.error),
          //  ),
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    FontAwesome.heart_o,
                  )),
              IconButton(onPressed: () {}, icon: const Icon(FontAwesome.send)),
            ],
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                post.postCaption,
                style: const TextStyle(color: Colors.black, fontSize: 17),
              ))
        ],
      ),
    );
  }
}
