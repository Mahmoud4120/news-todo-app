import 'package:dio/dio.dart';

//https://newsapi.org/ // base url
//v2/top-headlines? //method
// country=us&apiKey=682053e29b4042e4aaa39614f03613f0 //query
class DioHelper {
  static Dio dio = Dio();
  static init() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true));
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> query,
  }) async {
    return await dio.get(url, queryParameters: query);
  }
}
