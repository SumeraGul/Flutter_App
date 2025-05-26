import 'package:get_start_with_flutter/DataLayer/ApiClient.dart';
import 'package:get_start_with_flutter/DataLayer/DataBasehlper.dart';
import 'package:get_start_with_flutter/DataLayer/Models/Posts.dart';

class MyRepository {
  final dbHelper = DataBaseHelper.instance;

  final ApiClient apiService;
  MyRepository(this.apiService);


  Future<List<Post>> getItems() async {
    return await apiService.fetchPosts();
  }

  Future<void> addUser(String name, String email) async {
    await dbHelper.insertData(name, email);
  }




}

