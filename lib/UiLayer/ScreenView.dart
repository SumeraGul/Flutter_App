import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_start_with_flutter/UiLayer/ScreenViewModel.dart';
import 'package:provider/provider.dart';

class MyScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MyViewModel>();
    return Scaffold(
      appBar: AppBar(title: Text("Items")),
      body: viewModel.isLoading ? Center(child: CircularProgressIndicator()) : viewModel.error != null ? Center(child: Text("Error: ${viewModel.error}"))
        :  ListView.builder(
    itemCount: viewModel.items.length,
      itemBuilder: (context, index) {
        final post = viewModel.items[index];
        return ListTile(
          title: Text(post.title),
          subtitle: Text(post.body),
          leading: Text(post.id.toString()),
        );
      },
    ),
    floatingActionButton: FloatingActionButton(
    onPressed: () => context.read<MyViewModel>().loadItems(),
    child: Icon(Icons.refresh),
    ),
    );
  }

}