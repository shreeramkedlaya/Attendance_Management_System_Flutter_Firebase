// ignore_for_file: library_private_types_in_public_api

import 'package:attendence_management_system/widgets/dropDownWidget.dart';
import 'package:attendence_management_system/pages/reportpages/reportPdfDownload.dart';
import 'package:attendence_management_system/utils/names.dart';
import 'package:flutter/material.dart';

class AdminReport extends StatefulWidget {
  const AdminReport({Key? key}) : super(key: key);

  @override
  _AdminReportState createState() => _AdminReportState();
}

class _AdminReportState extends State<AdminReport> {
  @override
  Widget build(BuildContext context) {
    String programdropdownValue = Program[0];
    String subjectdropdownValue = Subject[0];
    String batchdropdownValue = Batch[0];
    String schooldropdownValue = School[0];
    String semdropdownValue = Semester[0];
    String yeardropdownValue = CollegeYear[0];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Report"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(physics: const BouncingScrollPhysics(), children: [
          Center(
            child: Image.asset('assets/Logo_Login_Page.png'),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                dropdown(
                    DropdownValue: programdropdownValue,
                    sTring: Program,
                    Hint: "Program"),
                const SizedBox(height: 20),
                dropdown(
                    DropdownValue: schooldropdownValue,
                    sTring: School,
                    Hint: "School"),
                const SizedBox(height: 20),
                dropdown(
                    DropdownValue: yeardropdownValue,
                    sTring: CollegeYear,
                    Hint: "Year"),
                const SizedBox(height: 20),
                dropdown(
                    DropdownValue: semdropdownValue,
                    sTring: Semester,
                    Hint: "Semester"),
                const SizedBox(height: 20),
                dropdown(
                    DropdownValue: subjectdropdownValue,
                    sTring: Subject,
                    Hint: "Subject"),
                const SizedBox(height: 20),
                dropdown(
                    DropdownValue: batchdropdownValue,
                    sTring: Batch,
                    Hint: "Batch"),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ReportPdfDownloadPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(300, 40),
                  ),
                  child: const Text("Genrate Report"),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
