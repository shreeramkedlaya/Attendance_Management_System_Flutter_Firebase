// ignore_for_file: non_ ant_identifier_names, file_names, library_private_types_in_public_api, non_constant_identifier_names

import 'package:attendence_management_system/pages/bottomNavBar.dart';
import 'package:attendence_management_system/widgets/editProfilePhotoWidget.dart';
import 'package:attendence_management_system/widgets/textFeildWidget.dart';
import 'package:attendence_management_system/utils/userPrefrences.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPrefrences.myUser;

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text("Edit Profile"),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 30),
          EditProfileWidget(
            imagePath: user.imagePath,
            onClicked: () async {},
          ),
          const SizedBox(height: 25),
          TextFieldWidget(
            label: "Username",
            text: user.facultyName,
            onChanged: (name) {},
          ),
          const SizedBox(height: 25),
          TextFieldWidget(
            label: "Email",
            text: user.email,
            onChanged: (email) {},
          ),
          const SizedBox(height: 25),
          TextFieldWidget(
            label: "Phone Number",
            text: user.phoneNo,
            onChanged: (phoneNo) {},
          ),
          const SizedBox(height: 25),
          TextFieldWidget(
            label: "Date Of Birth",
            text: user.DOB,
            onChanged: (DOB) {},
          ),
          const SizedBox(height: 20),
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
          )
        ],
      ),
    );
  }
}
