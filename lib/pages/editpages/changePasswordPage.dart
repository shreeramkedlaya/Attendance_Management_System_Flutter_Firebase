// ignore_for_file: unused_local_variable, file_names, library_private_types_in_public_api

import 'package:attendence_management_system/widgets/textFeildWidget.dart';
import 'package:attendence_management_system/utils/userPrefrences.dart';
import 'package:flutter/material.dart';

import '../bottomNavBar.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    final user = UserPrefrences.myUser;
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Change Password'),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 30),
          TextFieldWidget(
            label: "Current Password",
            text: "", //Change it to password
            onChanged: (pass) {},
          ),
          const SizedBox(height: 30),
          TextFieldWidget(
            label: "New Password",
            text: "", //Change it to password
            onChanged: (pass) {},
          ),
          const SizedBox(height: 30),
          TextFieldWidget(
            label: "Confirm Password",
            text: "", //Change it to password
            onChanged: (pass) {},
          ),
          const SizedBox(height: 30),
          Center(
            child: ElevatedButton(
              onPressed: () => {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const LoginNavScreen(),
                  ),
                  (route) => false,
                ),
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                fixedSize: const Size(300, 60),
              ),
              child: const Text("Confirm"),
            ),
          ),
        ],
      ),
    );
  }
}
