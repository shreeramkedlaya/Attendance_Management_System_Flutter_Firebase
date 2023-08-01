// ignore_for_file: library_private_types_in_public_api

import 'package:attendence_management_system/widgets/textfieldwidgetform.dart';
import 'package:flutter/material.dart';

import '../bottomNavBar.dart';

class AddFaculty extends StatefulWidget {
  const AddFaculty({Key? key}) : super(key: key);

  @override
  _AddFacultyState createState() => _AddFacultyState();
}

class _AddFacultyState extends State<AddFaculty> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.red,
          leading: const BackButton(),
          title: const Text('FACULTY DETAILS')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15),
            const Text(
              'ADD FACULTY',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            TextFieldWidgetForm(
              label: "Full Name",
              onChanged: (yuu) {},
              text: "",
            ),
            const SizedBox(height: 15),
            TextFieldWidgetForm(
              label: "Email",
              onChanged: (yuu) {},
              text: "",
            ),
            const SizedBox(height: 15),
            TextFieldWidgetForm(
              label: "College ID",
              onChanged: (yuu) {},
              text: "",
            ),
            const SizedBox(height: 15),
            TextFieldWidgetForm(
              label: "Phone",
              onChanged: (yuu) {},
              text: "",
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: TextFieldWidgetForm(
                    label: "Semester",
                    onChanged: (yuu) {},
                    text: "",
                  ),
                ),
                Flexible(
                  child: TextFieldWidgetForm(
                    label: "Subject",
                    onChanged: (yuu) {},
                    text: "",
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () => {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const AdminNavScreen(),
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
      ),
    );
  }
}
