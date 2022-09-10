import 'package:flutter/material.dart';

import '../model/user_model.dart';

class MySearchPage extends StatefulWidget {
  const MySearchPage({Key? key}) : super(key: key);
  static const String id = 'myserach_page';

  @override
  State<MySearchPage> createState() => _MySearchPageState();
}

class _MySearchPageState extends State<MySearchPage> {
  final _searchController = TextEditingController();
  List<Users> items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    items.add(Users(fullName: 'Akamljon', email: 'akmal@gmail.com', password: '', imageUrl: '', id: ''));
    items.add(Users(fullName: 'Akamljon', email: 'akmal@gmail.com', id: '', imageUrl: '', password: ''));
    items.add(Users(fullName: 'Akamljon', email: 'akmal@gmail.com', id: '', password: '', imageUrl: ''));
    items.add(Users(fullName: 'Akamljon', email: 'akmal@gmail.com', id: '', imageUrl: '', password: ''));
    items.add(Users(fullName: 'Akamljon', email: 'akmal@gmail.com', password: '', imageUrl: '', id: ''));
    items.add(Users(fullName: 'Akamljon', email: 'akmal@gmail.com', id: '', imageUrl: '', password: ''));
    items.add(Users(fullName: 'Akamljon', email: 'akmal@gmail.com', id: '', password: '', imageUrl: ''));
    items.add(Users(fullName: 'Akamljon', email: 'akmal@gmail.com', id: '', imageUrl: '', password: ''));
    items.add(Users(fullName: 'Akamljon', email: 'akmal@gmail.com', password: '', imageUrl: '', id: ''));
    items.add(Users(fullName: 'Akamljon', email: 'akmal@gmail.com', id: '', imageUrl: '', password: ''));
    items.add(Users(fullName: 'Akamljon', email: 'akmal@gmail.com', id: '', password: '', imageUrl: ''));
    items.add(Users(fullName: 'Akamljon', email: 'akmal@gmail.com', id: '', imageUrl: '', password: ''));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            'Search Page',
            style: TextStyle(
                fontSize: 25,
                fontFamily: 'Billabong',
                color: Colors.black,
                letterSpacing: 1),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                height: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey.withOpacity(0.2)),
                child: TextField(
                  controller: _searchController,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search',
                      hintStyle: TextStyle(
                          color: Colors.white, fontSize: 17, letterSpacing: 1)),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (ctx, index) => _itemOfUser(items[index]),
                ),
              ),
            ],
          ),
        ));
  }

  Widget _itemOfUser(Users user) {
    return SizedBox(
      height: 90,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(70),
                border: Border.all(
                  color: Colors.deepPurpleAccent,
                  width: 1.5,
                )),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(22.5),
              child: const Image(
                image: AssetImage('assets/images/ic_person.png'),
                height: 45,
                width: 45,
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.fullName,
                style:const TextStyle(color: Colors.black, fontSize: 17),
              ),
           const   SizedBox(height: 3,),
              Text(user.email,style:const TextStyle(color: Colors.black54,fontSize: 15),)

            ],
          ),
          Expanded(
              child:Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 30,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      )
                    ),
                    child:const Center(
                      child: Text('Follow'),
                    ),
                  )
                ],
              )
          ),
        ],
      ),
    );
  }
}
