import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instaclone/pages/my_feed_page.dart';
import 'package:flutter_instaclone/pages/my_likes_page.dart';
import 'package:flutter_instaclone/pages/my_profile_page.dart';
import 'package:flutter_instaclone/pages/my_serach_page.dart';
import 'package:flutter_instaclone/pages/my_upload_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String id = 'home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  int _currentTap = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (int index){
          setState(() {
            _currentTap=index;
          });
        },
        children: [
          MyFeedPage(_pageController),
          MySearchPage(),
          MyUploadPage(),
          MyLikesPage(),
          MyProfilePage(),
        ],
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: _currentTap,
        onTap: (int index){
          setState(() {
            _currentTap=index;
            _pageController.animateToPage(_currentTap, duration: Duration(milliseconds: 500), curve: Curves.easeIn);
          });
        },
        activeColor:const Color.fromRGBO(131, 58, 180, 1),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 28,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 28,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_box,
                size: 28,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                size: 28,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 28,
              ),
              label: ''),
        ],
      ),
    );
  }
}
