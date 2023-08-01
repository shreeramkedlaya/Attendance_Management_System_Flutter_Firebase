// ignore_for_file: library_private_types_in_public_api, file_names
import 'package:attendence_management_system/model/userDetailModel.dart';
import 'package:attendence_management_system/pages/bottomNavBar.dart';
import 'package:attendence_management_system/widgets/editbuttonWidget.dart';
import 'package:attendence_management_system/pages/detailspages/facultyDetailpage.dart';
import 'package:attendence_management_system/widgets/profilePhotoWidget.dart';
import 'package:attendence_management_system/pages/profilepages/profilepage.dart';
import 'package:attendence_management_system/pages/detailspages/studentDetailspage.dart';
import 'package:attendence_management_system/utils/userPrefrences.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    final user = UserPrefrences.myUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Center(
              child: Image.asset('assets/Logo_Login_Page.png'),
            ),
            const SizedBox(height: 20),
            ProfileWidget(
              imagePath: user.imagePath,
              size: 224,
            ),
            const SizedBox(height: 24),
            buildName(user),
            const SizedBox(height: 15),
            Center(child: buildSwitchToFacultyButton(user, context)),
            const SizedBox(height: 15),
            Center(child: buildStudentDetailsButton(user, context)),
            const SizedBox(height: 15),
            Center(child: buildFacultyDetailsButton(user, context)),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

Widget buildSwitchToFacultyButton(Faculty user, BuildContext context) =>
    ButtonWidget(
      text: 'Switch To Faculty',
      icon: Icons.switch_account,
      onClicked: () => {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const LoginNavScreen(),
          ),
        )
      },
    );
Widget buildStudentDetailsButton(Faculty user, BuildContext context) =>
    ButtonWidget(
      text: 'Student Details',
      icon: Icons.list_rounded,
      onClicked: () => {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const StudentDetailsPage(),
          ),
        )
      },
    );
Widget buildFacultyDetailsButton(Faculty user, BuildContext context) {
  return ButtonWidget(
    text: 'Faculty Details',
    icon: Icons.list_rounded,
    onClicked: () => {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const FacultyDetailsPage(),
        ),
      )
    },
  );
}
