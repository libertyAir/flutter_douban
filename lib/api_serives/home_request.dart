import 'package:douban/api_serives/http_request.dart';
import 'package:douban/pages/home/model/home_movie_model.dart';

class HomeRequest {
  static Future<List<MovieItem>> requestMovieList(int start) async{

    //1.url
    final movieURL = "https://api.douban.com/v2/movie/top250?start=${start}&count=5&apikey=0df993c66c0c636e29ecbb5344252a4a";
    //2.发送网络请求
    final res = await HttpRequest.request(movieURL);
    final subjects = res["subjects"];

    // 3.将Map转成Model
    List<MovieItem> movies = [];
    for (var sub in subjects) {
      movies.add(MovieItem.fromMap(sub));
    }

    print(movies);
    return movies;
  }
}