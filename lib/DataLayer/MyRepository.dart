import 'package:get_start_with_flutter/DataLayer/ApiClient.dart';
import 'package:get_start_with_flutter/DataLayer/Models/Posts.dart';

class MyRepository {

  final ApiClient apiService;
  MyRepository(this.apiService);


  Future<List<Post>> getItems() async {
    return await apiService.fetchPosts();
  }

}

