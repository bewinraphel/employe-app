import 'package:flutter/material.dart';
// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demofirebase/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyC3kSvjtxzbHcsFZrL6vnOHpVbOxym3hbw',
      appId: '1:1034583425265:android:7ce55e2df0142c81816950',
      projectId: 'demoe-c7b32',
      messagingSenderId:
          '1034583425265-dg0hch8vhqc8uutv1drj4duombschvkf.apps.googleusercontent.com',
    ),
  );
  runApp(const AddUser(
    fullName: "bewlin raphel",
    company: "tinos",
    age: 12,
  ));
}

class AddUser extends StatelessWidget {
  final String fullName;
  final String company;
  final int age;

  const AddUser(
      {Key? key,
      required this.fullName,
      required this.company,
      required this.age})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference users = FirebaseFirestore.instance.collection('new');

    Future<void> addUser() {
      // Call the user's CollectionReference to add a new user
      return users
          .add({
            'full_name': fullName, // John Doe
            'company': company, // Stokes and Sons
            'age': age // 42
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: TextButton(
          onPressed: addUser,
          child: Center(
            child: const Text(
              "Add User",
            ),
          ),
        ),
      ),
    );
  }
}
