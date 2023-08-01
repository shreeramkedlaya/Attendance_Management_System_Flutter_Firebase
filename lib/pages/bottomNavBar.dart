// ignore_for_file: file_names, library_private_types_in_public_api, non_constant_identifier_names

import 'package:attendence_management_system/pages/loginpages/logout.dart';
import 'package:attendence_management_system/pages/profilepages/adminPage.dart';
import 'package:attendence_management_system/pages/attendencepages/attendencedropdown1.dart';
import 'package:attendence_management_system/pages/detailspages/facultyScreen.dart';
import 'package:attendence_management_system/pages/profilepages/profilepage.dart';
import 'package:attendence_management_system/pages/reportpages/adminreport.dart';
import 'package:attendence_management_system/pages/reportpages/reportGenration.dart';
import 'package:attendence_management_system/theme/colors.dart';
import 'package:flutter/material.dart';

final List<Widget> facultynavbar = [
  const AttendenceDropdownPage1(),
  const ReportGenration(),
  const ProfilePage(),
  const Logout()
];

final List<Widget> adminnavbar = [
  const AdminPage(),
  const AdminReport(),
  const FacultyPage(),
  const Logout()
];

class LoginNavScreen extends StatefulWidget {
  const LoginNavScreen({Key? key}) : super(key: key);

  @override
  _LoginNavScreenState createState() => _LoginNavScreenState();
}

class _LoginNavScreenState extends State<LoginNavScreen> {
  int currentfaculty = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: facultynavbar[currentfaculty],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        currentIndex: currentfaculty,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        onTap: (index) => setState(() => currentfaculty = index),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment_outlined), label: 'Attendence'),
          BottomNavigationBarItem(
              icon: Icon(Icons.description_outlined), label: 'Report'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'Log Out'),
        ],
      ),
    );
  }
}

BottomNavigationBar BuildFacultyBottomNavBar(int currentindex) {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    backgroundColor: primaryColor,
    currentIndex: currentindex,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.white70,
    onTap: (index) => {currentindex = index},
    items: const [
      BottomNavigationBarItem(
          icon: Icon(Icons.assignment_outlined), label: 'Attendence'),
      BottomNavigationBarItem(
          icon: Icon(Icons.description_outlined), label: 'Report'),
      BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_outlined), label: 'Profile'),
      BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'Log Out'),
    ],
  );
}

BottomNavigationBar BuildAdminBottomNavBar(int currentindex) {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    backgroundColor: primaryColor,
    currentIndex: currentindex,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.white70,
    onTap: (index) => {currentindex = index},
    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.local_police), label: 'Admin'),
      BottomNavigationBarItem(icon: Icon(Icons.description), label: 'Report'),
      BottomNavigationBarItem(icon: Icon(Icons.badge), label: 'Faculty'),
      BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'Log Out'),
    ],
  );
}

class AdminNavScreen extends StatefulWidget {
  const AdminNavScreen({Key? key}) : super(key: key);

  @override
  _AdminNavScreenState createState() => _AdminNavScreenState();
}

class _AdminNavScreenState extends State<AdminNavScreen> {
  int currentadmin = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: adminnavbar[currentadmin],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: primaryColor,
        currentIndex: currentadmin,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        onTap: (index) => setState(() => currentadmin = index),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.local_police), label: 'Admin'),
          BottomNavigationBarItem(
              icon: Icon(Icons.description), label: 'Report'),
          BottomNavigationBarItem(icon: Icon(Icons.badge), label: 'Faculty'),
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'Log Out'),
        ],
      ),
    );
  }
}
