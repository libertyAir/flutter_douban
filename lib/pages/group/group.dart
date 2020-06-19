import 'package:flutter/material.dart';
import 'dart:math';
import 'package:douban/pages/home/widget/star.dart';

class DBGroupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("group"),),
      body: Container(
        child: Center(
          child: Column(
              children: testData()
          ),
        ),
      ),
    );
  }
}


List<Widget> testData() {

  List<Widget> array = [];
  for(int i = 0; i < 10; i++) {
    double stars = Random().nextInt(15)-Random().nextDouble();
//    print("======$stars======");
    array.add(StarRating(price: stars));
  }

//  array.add(StarRating(price: 6, unselectedColor: Colors.black,));
//  array.add(StarRating(price: 3.5, maxPrice: 7, unselectedColor: Colors.green,));
//  array.add(StarRating(price: 3.5, maxPrice: 10, count: 10, unselectedColor: Colors.grey,));
//  array.add(StarRating(price: 77, maxPrice: 100, count: 10, unselectedColor: Colors.grey,));


  array.add(StarRating(
    price: 77,
    maxPrice: 100,
    count: 10,
    selectedImage:Image.asset("assets/images/tabbar/home_active.png", width: 30,) ,
    unselectedImage: Image.asset("assets/images/tabbar/home.png", width: 30,),
    size: 30,
  ));

  array.add(StarRating(
    price: 77,
    maxPrice: 100,
    count: 5,
    selectedImage:Image.asset("assets/images/tabbar/home_active.png", width: 30,) ,
    unselectedImage: Image.asset("assets/images/tabbar/home.png", width: 30,),
    size: 30,
  ));
//  array.add(StarRating(price: 77, maxPrice: 100, count: 10, unselectedColor: Colors.grey,));

  return array;
}