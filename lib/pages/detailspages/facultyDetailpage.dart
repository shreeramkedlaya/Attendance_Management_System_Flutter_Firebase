// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:attendence_management_system/model/userDetailModel.dart';
import 'package:attendence_management_system/pages/addpages/add_faculty.dart';
import 'package:attendence_management_system/pages/editpages/edit_faculty.dart';
import 'package:attendence_management_system/utils/names.dart';
import 'package:attendence_management_system/utils/userPrefrences.dart';
import 'package:flutter/material.dart';

class FacultyDetailsPage extends StatefulWidget {
  const FacultyDetailsPage({Key? key}) : super(key: key);

  @override
  _FacultyDetailsPageState createState() => _FacultyDetailsPageState();
}

class _FacultyDetailsPageState extends State<FacultyDetailsPage> {
  final List<Faculty> user = UserPrefrences.FacultyList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Faculty Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
            itemCount: user.length,
            itemBuilder: (BuildContext context, int index) =>
                buildFacultyDetailsCard(context, index)),
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
          // icon:   Icon(Icons.thumb_up),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }

  buildFacultyDetailsCard(BuildContext context, int index) {
    var index2 = index + 1;
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
                        user[index].facultyId,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                      Text(
                        user[index].facultyName,
                        style: const TextStyle(fontSize: 15.0),
                      ),
                      Text(
                        user[0].email,
                        style: const TextStyle(fontSize: 15.0),
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 25),
                          Expanded(
                            child: Text(
                              user[0].phoneNo,
                              style:
                                  const TextStyle(color: Colors.grey, fontSize: 17.0),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "Sem : ${Semester[0]}",
                              style:
                                  const TextStyle(color: Colors.grey, fontSize: 17.0),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Subject : ${Subject[0]}",
                        style: const TextStyle(color: Colors.grey, fontSize: 17.0),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    const Text("Status"),
                    Switch(
                      value: user[index].isActive,
                      onChanged: (bool newValue) {
                        setState(
                          () {
                            user[index].isActive = !user[index].isActive;
                          },
                        );
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const EditFaculty(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.grey[600],
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5,
                        textStyle: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                      child: const Text("Edit"),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
