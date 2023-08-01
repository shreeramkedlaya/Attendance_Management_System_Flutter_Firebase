// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:attendence_management_system/pages/addpages/add_student.dart';
import 'package:attendence_management_system/pages/editpages/edit_student.dart';
import 'package:attendence_management_system/utils/names.dart';
import 'package:attendence_management_system/utils/userPrefrences.dart';
import 'package:flutter/material.dart';

class StudentDetailsPage extends StatefulWidget {
  const StudentDetailsPage({Key? key}) : super(key: key);

  @override
  _StudentDetailsPageState createState() => _StudentDetailsPageState();
}

class _StudentDetailsPageState extends State<StudentDetailsPage> {
  final studentvar = UserPrefrences.studentlist;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: studentvar.length,
            itemBuilder: (BuildContext context, int index) =>
                buildStudentDetailsCard(context, index)),
      ),
      // ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 150),
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const AddStud(),
              ),
            );
          },
          elevation: 15,
          label: const Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Text(
              'Add',
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
          ),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }

  buildStudentDetailsCard(BuildContext context, int index) {
    var index2 = index + 1;
    List<bool> isActive = StudentisActive;
    return Card(
      elevation: 5,
      shadowColor: Colors.grey[200],
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(width: 10),
                Text(index2.toString()),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Text(
                        studentvar[index].studentEnrollmentNo,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                      Text(
                        studentvar[index].studentName,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17.0),
                      ),
                      Text(
                        studentvar[index].studentemail,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13.0),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    const Text("Status"),
                    Switch(
                      value: isActive[index],
                      onChanged: (bool newValue) {
                        setState(
                          () {
                            isActive[index] = !isActive[index];
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "Program : ${studentvar[index].program}",
                        style: const TextStyle(fontSize: 13),
                      ),
                      Text(
                        "Batch : ${studentvar[index].batch}",
                        style: const TextStyle(fontSize: 13),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "Branch : ${studentvar[index].branch}",
                        style: const TextStyle(fontSize: 13),
                      ),
                      Text(
                        "Semester : ${studentvar[index].semester}",
                        style: const TextStyle(fontSize: 13),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "Year : ${studentvar[index].studingInYear}",
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const EditStud(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.grey[600],
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                fixedSize: const Size(200, 40),
                elevation: 5,
                textStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
              child: const Text("Edit"),
            )
          ],
        ),
      ),
    );
  }
}
