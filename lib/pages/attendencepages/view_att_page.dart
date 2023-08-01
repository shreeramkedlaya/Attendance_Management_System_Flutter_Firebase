// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../theme/colors.dart';
import '../../utils/names.dart';
import '../../utils/userPrefrences.dart';

class ViewAtt extends StatefulWidget {
  const ViewAtt({Key? key}) : super(key: key);

  @override
  State<ViewAtt> createState() => _ViewAttState();
}

class _ViewAttState extends State<ViewAtt> {
  DateTime dtslt = DateTime.now();

  Future<void> selectdate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: dtslt,
      firstDate: DateTime(2000, 1, 1),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(
        () {
          dtslt = picked;
          getAttData();
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
  Map<String, dynamic> attData = {};
  final Map<dynamic, dynamic> snames = {};
  final DateTime dt = DateTime.now();
//  final cond = stdlist.where('classname', isEqualTo: classsection);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Attendance Report'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 15),
          Center(
            child: Text(
              'Attendance Report of $semesterdropdownValue'
              '$sectiondropdownValue',
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
                        //popatt(doc);
                        getAttData();
                        return Card(
                          child: ListTile(
                            tileColor: attData[doc['rn'].toString()] != "1"
                                ? Colors.white
                                : Colors.green,
                            title: Text(
                              '${doc['rn']}   ${doc['name']}',
                              style: const TextStyle(fontSize: 20),
                            ),
                            /* onTap: () {
                                updateatt(doc['rn']);
                                setState(() {
                                  tapcolor = att[doc['rn']] == 0
                                      ? Colors.green
                                      : Colors.red;
                                });
                              } */
                          ),
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
          /* ElevatedButton(
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: Text('Submit Attendence?'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      print("cancelled");
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      saveAttendance();
                      Navigator.of(context).pop();
                    },
                    child: Text('Submit'),
                  ),
                ],
              ),
            ),
            style: ElevatedButton.styleFrom(fixedSize: Size(300, 40)),
            child: Text('submit'),
          ) */
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

  /* buildAttendenceCard(BuildContext context, int index) {
    var index2 = index + 1;

    return FocusedMenuHolder(
      menuWidth: MediaQuery.of(context).size.width * 0.75,
      duration: Duration(milliseconds: 350),
      animateMenuItems: true,
      onPressed: () {
        setState(() {
          ChangeState(isSelectedList, index, 1);
          ChangeColor(isSelectedList, index);
        });
      },
      menuItems: <FocusedMenuItem>[
        FocusedMenuItem(
            title: Text(
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
            title: Text(
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
            title: Text(
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
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              Text(
                index2.toString(),
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(width: 25),
              Text(
                studentvar[index].studentName,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  } */

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
    getAttData();
    if (doc['classname'] ==
        semesterdropdownValue.toString() + sectiondropdownValue.toString()) {
      final int rnum = doc['rn'];
      //    print(rnum);
      snames.addEntries({"rn": rnum, "name": doc['name']}.entries);
      if (att[rnum] == null) {
        att.addEntries({rnum: 0}.entries);
      }
    }
  }

  Future<void> getAttData() async {
    QuerySnapshot qs = await stdatt
        .where('classname',
            isEqualTo: semesterdropdownValue + sectiondropdownValue)
        .where('day', isEqualTo: dtslt.day.toString())
        .get();
    final attDataset = qs.docs.map((doc) => doc.get("att")).toList();
    if (attDataset.isNotEmpty) {
      String jsonString = attDataset[0];
      //final s = jsonDecode('{"5": "10"}');

      jsonString = jsonString.replaceAll('{', '{"');
      jsonString = jsonString.replaceAll(': ', '": "');
      jsonString = jsonString.replaceAll(', ', '", "');
      jsonString = jsonString.replaceAll('}', '"}');
      attData = jsonDecode(jsonString);
    } else {
      attData.clear();
    }

    // print(attData.keys);
    // print(attData["2"]);
    // for (int i = 0; i < attDataset.length; i++) {
    //   print(TextEditingValue.fromJSON(attDataset[i]));
    // }
  }
}
