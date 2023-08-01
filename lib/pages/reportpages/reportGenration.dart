// ignore_for_file: file_names, library_private_types_in_public_api, no_leading_underscores_for_local_identifiers

import 'package:attendence_management_system/widgets/dropDownWidget.dart';
import 'package:attendence_management_system/utils/names.dart';
import 'package:flutter/material.dart';
import 'att_report.dart';

class ReportGenration extends StatefulWidget {
  const ReportGenration({Key? key}) : super(key: key);

  @override
  _ReportGenrationState createState() => _ReportGenrationState();
}

class _ReportGenrationState extends State<ReportGenration> {
  void checksem() {
    if (yeardropdownValue == "1st") {}
  }

  @override
  void initState() {
    checksem();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = DateTime.now();
    DateTime selectedDate2 = DateTime.now();

    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101),
      );
      if (picked != null && picked != selectedDate) {
        setState(() {
          selectedDate = picked;
        });
      }
    }

    Future<void> _selectDate2(BuildContext context) async {
      final DateTime? picked2 = await showDatePicker(
        context: context,
        initialDate: selectedDate2,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101),
      ) /* .then((value) {
        setState(() {
          selectedDate2 = value!;
        });
      }) */
          ;
      if (picked2 != null && picked2 != selectedDate2) {
        setState(() {
          selectedDate2 = picked2;
        });
      }
    }

    /* void _showdatepicker() async {
      showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000, 1),
        lastDate: DateTime(2101),
      ).then((value) {
        setState(() {
          selectedDate = value!;
        });
      });
      print(selectedDate);
    } */

    return Scaffold(
      appBar: AppBar(title: const Text("Report")),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            /* SizedBox(height: 20),
            dropdown(
                DropdownValue: yeardropdownValue,
                sTring: CollegeYear,
                Hint: "Year"), */
            const SizedBox(height: 20),
            dropdown(
                DropdownValue: semesterdropdownValue,
                sTring: Semester,
                Hint: "Semester"),
            const SizedBox(height: 20),
            dropdown(
                DropdownValue: batchdropdownValue,
                sTring: Batch,
                Hint: "Batch"),
            const SizedBox(height: 20),
            dropdown(
                DropdownValue: subjectdropdownValue,
                sTring: Subject,
                Hint: "Subject"),
            const SizedBox(height: 40),
            Row(
              children: [
                const SizedBox(width: 50),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text("From :"),
                    const SizedBox(height: 10),
                    Text("${selectedDate.toLocal()}".split(' ')[0]),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () => _selectDate(context),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.red,
                        backgroundColor: Colors.red,
                        elevation: 10,
                        textStyle: const TextStyle(fontSize: 14),
                      ),
                      child: const Text(
                        'Select date',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 70),
                Column(
                  children: [
                    const Text("To :"),
                    const SizedBox(height: 10),
                    Text("${selectedDate2.toLocal()}".split(' ')[0]),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () => _selectDate2(context),
                      child: const Text(
                        'Select date',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  /* MaterialPageRoute(
                    builder: (context) => ReportPdfDownloadPage(),
                  ), */
                  MaterialPageRoute(
                    builder: (context) => const AttRep(),
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
    );
  }
}
