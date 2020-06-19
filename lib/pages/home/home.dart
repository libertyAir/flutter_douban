
import 'package:dio/dio.dart';
import 'package:douban/api_serives/home_request.dart';
import 'package:douban/api_serives/http_request.dart';
import 'package:douban/pages/home/model/home_movie_model.dart';
import 'package:douban/pages/home/widget/home_movie_item.dart';
import 'package:flutter/material.dart';

class DBHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("首页"),),
      body: DBHomeContent(),
    );
  }
}

class DBHomeContent extends StatefulWidget {

  @override
  _DBHomeContentState createState() => _DBHomeContentState();
}

class _DBHomeContentState extends State<DBHomeContent> {
  List<MovieItem> dataList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    HomeRequest.requestMovieList().then((data) {
      setState(() {
        dataList.addAll(data);
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dataList.length,
      itemBuilder: (BuildContext context, int index){
        return HomeMovieItem(dataList[index]);
      }
    );
  }
}
