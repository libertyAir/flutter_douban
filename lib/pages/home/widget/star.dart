import 'dart:math';

import 'package:flutter/material.dart';

class StarRating extends StatefulWidget {
  final double price;     //分数
  final double maxPrice;  //最多多少分数 (默认10分)
  final int count;        //多少颗星星  （默认5颗)
  final double size;      //每颗星星大小 (默认30)
  final Color unselectedColor;  //star未选择的颜色
  final Color selectedColor;    //star选中的颜色
  final Widget unselectedImage; //未选中star的Widget (如果设置了该Widget => color size失效)
  final Widget selectedImage;   //选中的start的Widget (如果设置了该Widget => color size失效)

  StarRating({
    @required this.price,
    this.maxPrice = 10,
    this.count = 5,
    this.size = 30,
    this.unselectedColor = const Color(0xffcccccc),
    this.selectedColor = Colors.red,
    Widget unselectedImage,
    Widget selectedImage
  }) : unselectedImage = unselectedImage ?? Icon(Icons.star_border, color: unselectedColor, size: size),
       selectedImage = selectedImage ?? Icon(Icons.star, color: selectedColor, size: size);

  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Row(
          children: buildUnselectedStar()
        ),
        Row(
          children: buildSelectedStar()
        )
      ],
    );
  }



  List<Widget> buildUnselectedStar() {
    return List.generate(widget.count, (index) {
      return widget.unselectedImage;
    });
  }

  List<Widget> buildSelectedStar() {
    //1.创建stars
    List<Widget> stars = List();

    //2.构建满的star widget 并添加到数组
    double starRating = calcStarRating();
    if (starRating < 0) return [];  //如果传值为负 或者是0分 直接返回

    for(int i = 0; i < starRating.floor(); i++){
      stars.add(widget.selectedImage);
    }

    //3.构建剩下的不完整的星星
    double leftWidth = (starRating-starRating.floor()) * widget.size;
    if(leftWidth > 0) {
      final halfStar = ClipRect(
          clipper: DBStarClipper(leftWidth),
          child: widget.selectedImage
      );
      stars.add(halfStar);
    }
    return stars;
  }

  //计算显示多少星星，如满分10，评分9.5 共显示5个星星 => 则return 4.5
  double calcStarRating() {
    double rating = widget.price/widget.maxPrice * widget.count;
    if(rating <= widget.count) {
      return rating;  //正常情况下，显示的星星小于等于总星星数
    }
    return widget.count.toDouble();  //如果传值错误，出现得分>总分的情况下  最多返回总星星数
  }

  int getFullStarCount() {
    return min(((widget.price/widget.maxPrice)*widget.count).floor(), widget.count);
  }
}


class DBStarClipper extends CustomClipper<Rect> {
  double width;

  DBStarClipper(this.width);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, width, size.height);
  }

  @override
  bool shouldReclip(DBStarClipper oldClipper) {
    return oldClipper.width != this.width;
  }
}
