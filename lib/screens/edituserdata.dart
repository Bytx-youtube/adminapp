import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditUser extends StatefulWidget {
  final String uid;

  EditUser({Key key, this.uid}) : super(key: key);
  @override
  _EditUserState createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  TextEditingController roleController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: roleController,
            decoration: InputDecoration(
              hintText: "Role..."
            ),
          ),
          TextFormField(
            controller: passwordController,
            decoration: InputDecoration(
                hintText: "Password..."
            ),
          ),
          GestureDetector(
            onTap: () async {
              String newRole = roleController.text.trim();
              String newPassword = passwordController.text.trim();

              FirebaseFirestore.instance.collection('users').doc(widget.uid).update({
                'role': newRole,
                'password': newPassword,
              });
            },
            child: Container(
              height: 50,
              width: 100,
              color: Colors.blue,
              child: Center(
                child: Text(
                  "UPDATE DATA",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
