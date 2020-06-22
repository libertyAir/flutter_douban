import 'package:douban/pages/home/detail/blank.dart';
import 'package:douban/pages/home/detail/movie_detail.dart';
import 'package:douban/pages/home/home.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class DBRoute {
  static final Map<String, WidgetBuilder> routes = {
    DBRootPage.routeName: (ctx) => DBRootPage(),
    DBHomePage.routeName: (ctx) => DBHomePage(),
  };

  static final String initialRoute = DBRootPage.routeName;

  static final RouteFactory generateRoute = (settings) {
    if (settings.name == MovieDetailPage.routeName) {
      return MaterialPageRoute(
          builder: (ctx) {
            return MovieDetailPage(settings.arguments);
          }
      );
    }
    return null;
  };

  static final RouteFactory unknownRoute = (settings) {
    return MaterialPageRoute(
        builder: (ctx) {
          return MovieBlankPage();
        }
    );
  };

}