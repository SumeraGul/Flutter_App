import 'package:dio/dio.dart';
import 'package:get_start_with_flutter/DataLayer/Models/Posts.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiClient{

  final Dio  dio = Dio
    (
    BaseOptions(
        baseUrl: 'https://jsonplaceholder.typicode.com/',
        connectTimeout :Duration(seconds: 5),
        receiveTimeout : Duration(seconds: 3)
  ),
  )..interceptors.add(PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    error: true,
    compact: true,
    maxWidth: 90,
  ));



  Future<List<Post>> fetchPosts() async {
    final response = await dio.get('posts');
    // Convert each JSON object to a Post object
    return (response.data as List)
        .map((json) => Post.fromJson(json))
        .toList();
  }
}
