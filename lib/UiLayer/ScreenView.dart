import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_start_with_flutter/DataLayer/ApiClient.dart';
import 'package:get_start_with_flutter/DataLayer/MyRepository.dart';
import 'package:get_start_with_flutter/UiLayer/ScreeenA.dart';
import 'package:get_start_with_flutter/UiLayer/ScreenViewModel.dart';

class MyScreen extends StatelessWidget {
  MyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Inject dependencies (ideally this goes in a binding or main setup)
    Get.put(ApiClient());
    final MyViewModel viewModel =
    Get.put(MyViewModel(MyRepository(Get.find<ApiClient>())));

    return Scaffold(
      appBar: AppBar(title: Text("Items")),
      body: Obx(() {
        if (viewModel.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (viewModel.error.value != null) {
          return Center(child: Text("Error: ${viewModel.error.value}"));
        } else {
          return ListView.builder(
            itemCount: viewModel.items.length,
            itemBuilder: (context, index) {
              final post = viewModel.items[index];
              return ListTile(
                title: Text(post.title),
                subtitle: Text(post.body),
                leading: Text(post.id.toString()),
              );
            },
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>   Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ScreenA()),
        ),
        // onPressed: () => viewModel.loadItems(),
        child: Icon(Icons.refresh),
      ),
    );
  }
}
