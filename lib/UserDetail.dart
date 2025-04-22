// import 'dart:developer';
// import 'dart:ffi';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class UserDetail extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() =>UserDetailSate();
// }
//
//
// class UserDetailSate extends State<UserDetail>{
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController ageController = TextEditingController();
//
//   void saveData() async{
//     final pref =  await SharedPreferences.getInstance();
//     String name = "";
//     String age =  "";
//     setState(() {
//       final user = User(name:  nameController.text, age: ageController.text );
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Saved: $user')),
//       );
//     });
//     await pref.setString("name",name);
//     await pref.setString("age",age);
//     log("save the values $name $age");
//   }
//
//   void getData() async{
//     final pref  = await SharedPreferences.getInstance();
//     String? name = "";
//     setState(() {
//       name = pref.getString("name");
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Saved: $name')),
//       );
//       log('name from  shared prefernce $name');
//
//     });
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("User Detail"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextFormField (
//               controller: nameController,
//               decoration: InputDecoration(
//                 labelText: "Enter your name",
//               ),
//             ),
//             SizedBox(height: 16),
//             TextFormField (
//               controller: ageController,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                 labelText: "Enter your age",
//               ),
//             ),
//             SizedBox(height: 24),
//
//             ElevatedButton(
//               onPressed: saveData,
//               child: Text("Add"),
//             ),
//             ElevatedButton(
//               onPressed: getData,
//               child: Text("Show"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//  }
//
//
//
//
//
