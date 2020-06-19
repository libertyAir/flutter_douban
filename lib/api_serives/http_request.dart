// https://api.douban.com/v2/movie/top250?start=25&count=25&apikey=0df993c66c0c636e29ecbb5344252a4a
import 'package:dio/dio.dart';

class HttpRequest {
  static final Dio dio = Dio();

  static Future request(String url,
      {Map<String, dynamic> params, Interceptor inter}) async
  {
    try {
      Response response = await Dio().get(url);
//      print(response);
      return response.data;
    } catch (e) {
//      print(e);
      return Future.error(e);
    }
  }
}
