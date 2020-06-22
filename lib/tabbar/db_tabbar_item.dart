import 'package:flutter/material.dart';

class DBTabbarItem extends BottomNavigationBarItem {
  DBTabbarItem(
      String iconName,
      String title)
      : super(
          icon: Image.asset("assets/images/tabbar/${iconName}.png",width: 30,gaplessPlayback: true,),
          activeIcon: Image.asset("assets/images/tabbar/${iconName}_active.png",width: 30,gaplessPlayback: true,),
          title: Text(title)
        );
}
