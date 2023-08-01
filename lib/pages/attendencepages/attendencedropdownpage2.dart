// ignore_for_file: library_private_types_in_public_api

import 'package:attendence_management_system/utils/button.dart';
import 'package:attendence_management_system/widgets/dropDownWidget.dart';
import 'package:attendence_management_system/utils/names.dart';
import 'package:flutter/material.dart';

import 'att_page.dart';

class AttendenceDropdownpage2 extends StatefulWidget {
  const AttendenceDropdownpage2({Key? key}) : super(key: key);

  @override
  _AttendenceDropdownpage2State createState() {
    return _AttendenceDropdownpage2State();
  }
}

class _AttendenceDropdownpage2State extends State<AttendenceDropdownpage2> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(
        () {
          selectedDate = picked;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text("Attendence"),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(
            height: 30,
          ),
          const Center(
            child: Text(
              "Attendence Management System",
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                dropdown(
                  DropdownValue: semesterdropdownValue,
                  sTring: Semester,
                  Hint: "Semester",
                ),
                const SizedBox(height: 20),
                dropdown(
                  DropdownValue: batchdropdownValue,
                  sTring: Batch,
                  Hint: "Batch",
                ),
                const SizedBox(height: 20),
                dropdown(
                  DropdownValue: subjectdropdownValue,
                  sTring: Subject,
                  Hint: "Subject",
                ),
                const SizedBox(height: 30),
                Button(
                    onTap: () {
                      return _selectDate(context);
                    },
                    text: 'Select Date'),
                const SizedBox(height: 20),
                Center(
                  child: Container(
                    width: 350,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                          color: Colors.grey,
                          style: BorderStyle.solid,
                          width: 0.80),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(5.0, 5.0),
                          blurRadius: 10.0,
                          spreadRadius: 2.0,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          Text(
                            "${selectedDate.toLocal()}".split(' ')[0],
                            style: const TextStyle(fontSize: 30),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child:
                                      Text("Program : $programdropdownValue"),
                                ),
                                Expanded(
                                  child: Text("Branch : $branchdropdownValue"),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text("Year : $yeardropdownValue"),
                                ),
                                Expanded(
                                  child:
                                      Text("Semester : $semesterdropdownValue"),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Batch : $batchdropdownValue",
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "Subject : $subjectdropdownValue",
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Button(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => const AttPage(),
                                        ),
                                      );
                                    },
                                    text: 'Take Attendence',
                                  ),
                                  /* ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                                AttendencePage(),
                                        ),
                                      );
                                    },
                                    child:   Text("Take Attendence"),
                                  ), */
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
