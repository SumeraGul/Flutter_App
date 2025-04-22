import 'package:flutter/cupertino.dart';
import 'package:get_start_with_flutter/DataLayer/Models/Posts.dart';
import 'package:get_start_with_flutter/DataLayer/MyRepository.dart';

class MyViewModel extends ChangeNotifier{
   final MyRepository  repository;
   MyViewModel(this.repository);

   List<Post> items = []; // ✅ Now inside the class
   bool isLoading = false;
   String? error;

   Future<void> loadItems()  async {
     isLoading = true;
     error = null;
     notifyListeners();
     try{
       items = await repository.getItems();
   }
  catch(e){
       error = e.toString();
     }
     isLoading = false;
     notifyListeners();
}

}