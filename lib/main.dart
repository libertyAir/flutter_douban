import 'package:douban/Pages/Home/home.dart';
import 'package:douban/pages/group/group.dart';
import 'package:douban/pages/mall/mall.dart';
import 'package:douban/pages/profile/profile.dart';
import 'package:douban/pages/subject/subject.dart';
import 'package:douban/tabbar/tabbar_items.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DBApp());
}

class DBApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DBRootPage(),
      theme: ThemeData(
        primaryColor: Colors.green,
//        highlightColor: Color.fromRGBO(0, 0, 0, 0),
//        splashColor: Color.fromRGBO(0, 0, 0, 0)
      ),
    );
  }
}

class DBRootPage extends StatefulWidget {
  @override
  _DBRootPageState createState() => _DBRootPageState();
}

class _DBRootPageState extends State<DBRootPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: <Widget>[
          DBHomePage(),
          DBSubjectPage(),
          DBGroupPage(),
          DBMallPage(),
          DBProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed, //显示icon下方的文字
          items: items,
          selectedItemColor: Colors.green,
//          selectedFontSize: 14,
//          unselectedFontSize: 14,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
    );
  }
}
