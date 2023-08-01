// ignore_for_file: unused_local_variable, library_private_types_in_public_api

import 'package:attendence_management_system/pages/editpages/changePasswordPage.dart';
import 'package:attendence_management_system/model/userDetailModel.dart';
import 'package:attendence_management_system/widgets/editbuttonWidget.dart';
import 'package:attendence_management_system/widgets/profilePhotoWidget.dart';
import 'package:attendence_management_system/utils/userPrefrences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

final uSer = FirebaseAuth.instance.currentUser!;

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    int currentindex = 0;
    getGroup(context);
    final user = UserPrefrences.myUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Faculty Profile"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Center(
              child: Image.asset('assets/newlogo.jpg'),
            ),
            const SizedBox(height: 20),
            ProfileWidget(
              imagePath: user.imagePath,
              size: 224,
            ),
            const SizedBox(height: 15),
            buildName(user),
            const SizedBox(height: 45),
            //Center(child: buildEditButton(user, context)),
            const SizedBox(height: 15),
            Center(child: buildChangePassButton(user, context)),
            const SizedBox(height: 24),
            //Center(child: buildSwitchToAdminButton(user, context)),
          ],
        ),
      ),
    );
  }

  void getGroup(BuildContext context) {}
}

Widget buildName(Faculty user) {
  return Column(
    children: [
      Text(
        uSer.email!,
        //user.facultyName,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
      ),
      const SizedBox(height: 8),
    ],
  );
}

/* Widget buildEditButton(Faculty user, BuildContext context) => ButtonWidget(
      text: 'Edit Profile',
      icon: Icons.person,
      onClicked: () => {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => EditProfilePage(),
          ),
        )
      },
    ); */
Widget buildChangePassButton(Faculty user, BuildContext context) =>
    ButtonWidget(
      text: 'Change Password',
      icon: Icons.lock,
      onClicked: () => {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ChangePassword(),
          ),
        )
      },
    );
/* Widget buildSwitchToAdminButton(Faculty user, BuildContext context) =>
    ButtonWidget(
      text: 'Switch to Admin',
      icon: Icons.switch_account,
      onClicked: () => {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => AdminNavScreen(),
          ),
        )
      },
    ); */
