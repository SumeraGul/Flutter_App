import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_start_with_flutter/DataLayer/ApiClient.dart';
import 'package:get_start_with_flutter/DataLayer/MyRepository.dart';
import 'package:get_start_with_flutter/UiLayer/ScreenView.dart';
import 'package:get_start_with_flutter/UiLayer/ScreenViewModel.dart';

class ScreenA extends StatelessWidget {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    Get.put(ApiClient());
    final MyViewModel userViewModel =
    Get.put(MyViewModel(MyRepository(Get.find<ApiClient>())));
    return Scaffold(
      appBar: AppBar(title: const Text('Add User')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String name = nameController.text;
                String email = emailController.text;
                await userViewModel.addUser(name, email);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('User Added!\nName: $name\nEmail: $email'),
                  ),
                );
              },
              child: const Text('Add User'),
            ),


          ],
        ),
      ),
    );
  }
}

