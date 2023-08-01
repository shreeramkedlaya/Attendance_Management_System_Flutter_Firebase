// ignore_for_file: non_ ant_identifier_names, library_private_types_in_public_api, file_names, avoid_print, non_constant_identifier_names

import 'package:attendence_management_system/pages/bottomNavBar.dart';
import 'package:attendence_management_system/theme/colors.dart';
import 'package:attendence_management_system/utils/names.dart';
import 'package:attendence_management_system/utils/userPrefrences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';

class AttendencePage extends StatefulWidget {
  const AttendencePage({Key? key}) : super(key: key);

  @override
  _AttendencePageState createState() => _AttendencePageState();
}

class _AttendencePageState extends State<AttendencePage> {
  final studentvar = UserPrefrences.studentlist;
  Future att_submt() async {
    print('submitted');
    // ignore: todo
    // TODO: add send report function and send to firestore
    return MaterialPageRoute(builder: ((context) => const LoginNavScreen()));
  }

  final stdlist = FirebaseFirestore.instance.collection('students');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text("Attendence"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 15.0),
          const Center(
            child: Text(
              "Select those who are present and \n     long press for more options",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 550,
            width: 400,
            child: ListView.builder(
              itemCount: studentvar.length,
              itemBuilder: (context, index) =>
                  buildAttendenceCard(context, index),
            ),
          ),
          const SizedBox(height: 25),
          ElevatedButton(
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Submit Attendence?'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: att_submt,
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
            style: ElevatedButton.styleFrom(fixedSize: const Size(300, 40)),
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }

  buildAttendenceCard(BuildContext context, int index) {
    var index2 = index + 1;

    return FocusedMenuHolder(
      menuWidth: MediaQuery.of(context).size.width * 0.75,
      duration: const Duration(milliseconds: 350),
      animateMenuItems: true,
      onPressed: () {
        setState(() {
          ChangeState(isSelectedList, index, 1);
          ChangeColor(isSelectedList, index);
        });
      },
      menuItems: <FocusedMenuItem>[
        FocusedMenuItem(
            title: const Text(
              "Present",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
            onPressed: () {
              setState(
                () {
                  ChangeState(isSelectedList, index, 1);
                  ChangeColor(isSelectedList, index);
                },
              );
            },
            backgroundColor: green),
        FocusedMenuItem(
            title: const Text(
              "Absent",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            onPressed: () {
              setState(
                () {
                  ChangeState(isSelectedList, index, 0);
                  ChangeColor(isSelectedList, index);
                },
              );
            },
            backgroundColor: red),
        FocusedMenuItem(
            title: const Text(
              "Leave",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              setState(
                () {
                  ChangeState(isSelectedList, index, 2);
                  ChangeColor(isSelectedList, index);
                },
              );
            },
            backgroundColor: yellow)
      ],
      child: Card(
        color: attendencecolor[index],
        elevation: 2,
        shadowColor: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              Text(
                index2.toString(),
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(width: 25),
              Text(
                studentvar[index].studentName,
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void ChangeState(List<int> isSelectedList, int value, int i) {
    isSelectedList[value] = i;
  }

  void ResetState() {
    for (int state = 0; state < attendencecolor.length; state++) {
      attendencecolor[state] = Colors.white;
    }
  }

  void ChangeColor(List<int> isSelectedList, int index) {
    if (isSelectedList[index] == 1) {
      attendencecolor[index] = green;
    } else {
      if (isSelectedList[index] == 2) {
        attendencecolor[index] = yellow;
      } else {
        attendencecolor[index] = red;
      }
    }
  }
}
