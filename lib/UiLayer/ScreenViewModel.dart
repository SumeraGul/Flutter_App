import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_start_with_flutter/DataLayer/DataBasehlper.dart';
import 'package:get_start_with_flutter/DataLayer/Models/Posts.dart';
import 'package:get_start_with_flutter/DataLayer/MyRepository.dart';

class MyViewModel extends GetxController{
   final MyRepository  repository;
   MyViewModel(this.repository);
   final dbHelper = DataBaseHelper.instance;

   var items = <Post>[].obs;


   // # List<Post> items = []; // ✅ Now inside the class
   var isLoading = false.obs;
   var  error = RxnString();


   Future<void> addUser(String name, String email) async {
     await dbHelper.insertData(name, email);
   }

   Future<void> loadItems()  async {
     isLoading.value  = true;
     error.value = null;
     //notifyListeners();
     try{
       items.value  = await repository.getItems();
   }
  catch(e){
       error.value = e.toString();
     }
     isLoading.value  = false;
    // notifyListeners();
}

}