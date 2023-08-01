// ignore_for_file: library_private_types_in_public_api

import 'package:attendence_management_system/pages/attendencepages/view_att_page.dart';
import 'package:attendence_management_system/widgets/dropDownWidget.dart';
import 'package:attendence_management_system/utils/names.dart';
import 'package:flutter/material.dart';

import 'att_page.dart';

class AttendenceDropdownPage1 extends StatefulWidget {
  const AttendenceDropdownPage1({Key? key}) : super(key: key);

  @override
  _AttendenceDropdownPage1State createState() =>
      _AttendenceDropdownPage1State();
}

class _AttendenceDropdownPage1State extends State<AttendenceDropdownPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Center(
              child: Image.asset('assets/newlogo.jpg'),
            ),
            const SizedBox(height: 30),
            const Center(
              child: Text(
                "Attendence Management System",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
            ),
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  /* dropdown(
                    DropdownValue: programdropdownValue,
                    Hint: "Program",
                    sTring: Program,
                  ), */
                  const SizedBox(height: 20),
                  dropdown(
                    DropdownValue: semesterdropdownValue,
                    Hint: "Class",
                    sTring: Semester,
                  ),
                  const SizedBox(height: 20),
                  dropdown(
                      DropdownValue: sectiondropdownValue,
                      sTring: Section,
                      Hint: "Section"),
                  const SizedBox(height: 20),
                  /* dropdown(
                    DropdownValue: yeardropdownValue,
                    sTring: CollegeYear,
                    Hint: "Year",
                  ), */
                  const SizedBox(height: 45),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const AttPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      fixedSize: const Size(300, 60),
                      backgroundColor: Colors.grey[100],
                      elevation: 10,
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    child: const Text("Take attendance"),
                  ),
                  const SizedBox(height: 45),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ViewAtt(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      fixedSize: const Size(300, 60),
                      backgroundColor: Colors.grey[100],
                      elevation: 10,
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    child: const Text("View attendance"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
