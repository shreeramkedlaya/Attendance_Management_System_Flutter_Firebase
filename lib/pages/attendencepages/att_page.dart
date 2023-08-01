// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../theme/colors.dart';
import '../../utils/names.dart';
import '../../utils/userPrefrences.dart';

class AttPage extends StatefulWidget {
  const AttPage({Key? key}) : super(key: key);

  @override
  State<AttPage> createState() => _AttPageState();
}

class _AttPageState extends State<AttPage> {
  DateTime dtslt = DateTime.now();

  Future<void> selectdate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: dtslt,
      firstDate: DateTime(2000, 1, 1),
      lastDate: DateTime(2101),
    );
    //print(picked!.day);
    if (picked != null) {
      setState(
        () {
          dtslt = picked;
        },
      );
    }
  }

  Color tapcolor = Colors.white;

  final studentvar = UserPrefrences.studentlist;
  //final classsection = semesterdropdownValue + sectiondropdownValue;
  final stdlist = FirebaseFirestore.instance.collection('students').where(
      'classname',
      isEqualTo: semesterdropdownValue + sectiondropdownValue);
  final dummy = FirebaseFirestore.instance.collection('dummy');
  final stdatt = FirebaseFirestore.instance.collection('studentAtt');
  final Map<int, int> att = {};
  final Map<dynamic, dynamic> snames = {};
  final DateTime dt = DateTime.now();
//  final cond = stdlist.where('classname', isEqualTo: classsection);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Attendance'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 15),
          Center(
            child: Text(
              'Attendance of $semesterdropdownValue' '$sectiondropdownValue',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Center(
            child: SizedBox(
              width: 300,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(elevation: 15),
                onPressed: () => selectdate(context),
                label: Text("${dtslt.toLocal()}".split(' ')[0]),
                icon: const Icon(Icons.edit),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Center(
            child: SizedBox(
              height: 700,
              width: 400,
              child: StreamBuilder<QuerySnapshot>(
                stream: stdlist.snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView(
                      children: snapshot.data!.docs.map((doc) {
                        popatt(doc);
                        return Card(
                          child: ListTile(
                              tileColor: att[doc['rn']] == 1
                                  ? Colors.green
                                  : Colors.white,
                              title: Text(
                                '${doc['rn']}   ${doc['name']}',
                                style: const TextStyle(fontSize: 20),
                              ),
                              onTap: () {
                                updateatt(doc['rn']);
                                setState(() {
                                  tapcolor = att[doc['rn']] == 0
                                      ? Colors.green
                                      : Colors.red;
                                });
                              }),
                        );
                      }).toList(),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
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
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      saveAttendance();
                      Navigator.of(context).pop();
                      /* MaterialPageRoute(
                        builder: (context) => AttendenceDropdownPage1(),
                      ); */

                      Navigator.of(context).pop();
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
            style: ElevatedButton.styleFrom(fixedSize: const Size(300, 40)),
            child: const Text('submit'),
          )
        ],
      ),
    );
  }

  saveAttendance() {
    //print(att.toString());
    //bool sec = att[2] == 1 ? true : false;
    //print(att[2].toString());
    //dummy.doc(dt.toString().split(' ')[0]).set({'abc.info': att[2]});

    final classsection = semesterdropdownValue + sectiondropdownValue;

    final docid = classsection +
        dtslt.year.toString() +
        dtslt.month.toString() +
        dtslt.day.toString();
    stdatt.doc(docid).set({
      'classname': classsection,
      'day': '${dtslt.day}',
      'att': att.toString(),
    });
    //print(s);
    att.forEach((key, value) {});
    // print(att.keys);
    //dummy.doc('dummy').update({'abc': att[1]});
    //dummy.doc('dummy').update({'def': att[1]});
    //dummy.doc('dummy').set({'attendance': att});
  }

  updateatt(int rn) {
    /* print(rn);
    print(att[rn]); */
    if (att[rn] == 0) {
      att.addEntries({rn: 1}.entries);
    } else if (att[rn] == 1) {
      att.addEntries({rn: 0}.entries);
    }
  }

  void ChangeState(List<int> isSelectedList, int value, int i) {
    isSelectedList[value] = i;
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

  void changestate() {}
  void popatt(doc) {
    if (doc['classname'] ==
        semesterdropdownValue.toString() + sectiondropdownValue.toString()) {
      final int rnum = doc['rn'];
      snames.addEntries({"rn": rnum, "name": doc['name']}.entries);
      if (att[rnum] == null) {
        att.addEntries({rnum: 0}.entries);
      }
    }
  }
}
