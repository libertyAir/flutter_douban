import 'package:flutter/material.dart';

class MovieDetailPage extends StatelessWidget {
  static const routeName = "movie_detail";

  String movieName;
  MovieDetailPage(this.movieName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("详情")
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: "这是", style: TextStyle(fontSize: 20)),
                  TextSpan(text: movieName, style: TextStyle(fontSize: 25, color: Colors.orange)),
                  TextSpan(text: "详情", style: TextStyle(fontSize: 20))
                ]
              )
            ),
            RaisedButton(
              child: Text("back"),
              onPressed: () {
                back(context);
              },
            )
          ],
        ),
      ),
    );
  }

  void back(BuildContext context) {
    print("back");
    Navigator.of(context).pop("a detail message");
  }
}
