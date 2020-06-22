import 'package:douban/api_serives/home_request.dart';
import 'package:douban/pages/home/detail/movie_detail.dart';
import 'package:douban/pages/home/model/home_movie_model.dart';
import 'package:douban/pages/home/widget/home_movie_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class DBHomePage extends StatelessWidget {
  static const routeName = "home";

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
  int start_index = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    HomeRequest.requestMovieList(start_index).then((data) {
      setState(() {
        dataList.addAll(data);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
      child: ListView.builder(
        primary: true,  //内容不够时是否能滚动
        itemCount: dataList.length,
        itemBuilder: (BuildContext context, int index){
          //手动添加rank
          MovieItem item = dataList[index];
          item.rank = index+1;
          return GestureDetector(
            child: HomeMovieItem(dataList[index]),
            onTap: () {
              print(index);
              if(index+1 <= 3) {
                _jumpToDetail(context, index);
              } else if (index+1 <= 6) {
                _jumpToDetail2(context, index);
              } else {
                _jumpToBlank(context);
              }
            },
          );
        }
      ),
      onRefresh: () async{
        await HomeRequest.requestMovieList(start_index).then((data) {
          setState(() {
            dataList.clear();
            dataList.addAll(data);
          });
        }).catchError((onError){
          setState(() {

          });
        }).whenComplete(() {
          setState(() {

          });
        });
      },

      onLoad: () async {
        await HomeRequest.requestMovieList(dataList.length).then((data) {
          setState(() {
            dataList.addAll(data);
          });
        }).catchError((onError){
          setState(() {
            print("-----------------${onError}--------------");
          });
        }).whenComplete(() {
          setState(() {
            print("=================complete================");
          });
        });
      },

    );
  }

  _jumpToDetail(BuildContext context, int index) {
    //1.普通跳转
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return MovieDetailPage(dataList[index].title);
        }
      )
    ).then((value) {
      print(value);
    });
  }

  _jumpToDetail2(BuildContext context, int index) {
    //2.route跳转
    Navigator.of(context).pushNamed(MovieDetailPage.routeName, arguments: dataList[index].title);
  }


  _jumpToBlank(BuildContext context) {
    //3.route跳转到未注册过的页面
    Navigator.of(context).pushNamed("aaaaaa");
  }
}
