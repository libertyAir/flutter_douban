import 'package:douban/pages/home/model/home_movie_model.dart';
import 'package:douban/pages/home/widget/dashed_line.dart';
import 'package:douban/pages/home/widget/star.dart';
import 'package:flutter/material.dart';

class HomeMovieItem extends StatelessWidget {
  MovieItem item ;
  HomeMovieItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 8, color: Color(0xffe2e2e2))),
      ),
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildRankWidget(),
          SizedBox(height: 8,),
          buildInfoWidget(),
          SizedBox(height: 8,),
          buildDescWidget(),
        ],
      ),
    );
  }

  //1.电影排名
  Widget buildRankWidget() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 238, 205, 144),
        borderRadius: BorderRadius.circular(3)
      ),
      child: Text("No.${item.rank}",style: TextStyle(fontSize: 20),),
    );
  }

  //2.中间信息部分
  Widget buildInfoWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //左侧图片
        buildImageWidget(),
        SizedBox(width: 8,),
        //中间内容
        buildInfoContent(),
        SizedBox(width: 8,),
        //虚线
        buildInfoLineWidget(),
        SizedBox(width: 8,),
        //按钮
        buildWishWidget(),
        SizedBox(width: 8,),
      ],
    );
  }
  
  //2.0 左边图片
  Widget buildImageWidget() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(3),
      child: Image.network(item.imageURL,width: 110,)
    );
  }

  //2.1 中间info里的content部分
  Widget buildInfoContent() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildInfoTitleWidget(),
          SizedBox(height: 5),
          buildInfoPriceWidget(),
          SizedBox(height: 5),
          buildInfoDetailWidget(),
        ],
      ),
    );
  }
  //2.1.1标题部分
  Widget buildInfoTitleWidget() {
    return Stack(
      children: <Widget>[
        Icon(Icons.play_circle_outline, color: Colors.redAccent, size: 24),
        Text.rich(
          TextSpan(children: [
            TextSpan(text: "      " + item.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            TextSpan(text: "(${item.playDate})", style: TextStyle(fontSize: 18, color: Colors.black54))
          ]),
        ),
      ],
    );
  }

  //2.1.2评分
  Widget buildInfoPriceWidget() {
    return FittedBox(
      child: Row(
        children: <Widget>[
          StarRating(
            price: item.rating,
            size: 15,
            selectedColor: Colors.orangeAccent,
          ),
          SizedBox(width: 5),
          Text(item.rating.toString())
        ],
      ),
    );
  }

  //2.1.3详情部分
  Widget buildInfoDetailWidget() {
    // 1.字符串拼接
    final genresString = item.genres.join(" ");
    final directorString = item.director.name;
    List<Actor> casts = item.casts;
    final actorString = item.casts.map((item) => item.name).join(" ");

    return Text(
      "$genresString / $directorString / $actorString",
      softWrap: true,
      maxLines:3, //这里最大行数 待研究一下
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: 16),
    );
  }

  //2.2线
  Widget buildInfoLineWidget() {
    return Container(
      height: 100,
      child: HYDashedLine(
        axis: Axis.vertical,
        count: 10,
        dashedWidth: .4,
        dashedHeight: 6,
        color: Colors.orangeAccent,
      ),
    );
  }

  //2.3想看按钮
  Widget buildWishWidget() {
    return Container(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset("assets/images/home/wish.png",width: 30,),
          Text("想看",style: TextStyle(fontSize: 16,color: Colors.orangeAccent),)
        ],
      ),
    );
  }
  
  //3.底部描述部分
  Widget buildDescWidget() {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xfff2f2f2),
        borderRadius: BorderRadius.circular(5)
      ),
      child: Text(item.originalTitle),
    );
  }
}
