// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:attendence_management_system/model/userDetailModel.dart';
import 'package:attendence_management_system/pages/addpages/add_faculty.dart';
import 'package:attendence_management_system/widgets/profilePhotoWidget.dart';
import 'package:attendence_management_system/utils/names.dart';
import 'package:attendence_management_system/utils/userPrefrences.dart';
import 'package:flutter/material.dart';

class FacultyPage extends StatefulWidget {
  const FacultyPage({Key? key}) : super(key: key);

  @override
  _FacultyPageState createState() => _FacultyPageState();
}

class _FacultyPageState extends State<FacultyPage> {
  final List<Faculty> user = UserPrefrences.FacultyList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Faculty"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: user.length,
                itemBuilder: (BuildContext context, int index) =>
                    buildFacultyCard(context, index),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 150),
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const AddFaculty(),
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

  buildFacultyCard(BuildContext context, int index) {
    List<bool> isActive = FacultiesisActive;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            const SizedBox(width: 10),
            ProfileWidget(imagePath: user[index].imagePath, size: 64),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(
                    user[index].facultyName,
                    style:
                        const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  Text(
                    user[index].facultyId,
                    style: const TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
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
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
