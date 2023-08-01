import 'package:flutter/material.dart';

class AttRep extends StatefulWidget {
  const AttRep({Key? key}) : super(key: key);

  @override
  State<AttRep> createState() => _AttRepState();
}

class _AttRepState extends State<AttRep> {
  DateTime? dateselect = DateTime.now();
  Future<void> selectdate(BuildContext context) async {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Report')),
        body: Column(
          children: <Widget>[
            const SizedBox(height: 25),
            Center(
              child: SizedBox(
                width: 300,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(elevation: 15),
                  onPressed: () => selectdate(context),
                  label: Text("${dateselect?.toLocal()}".split(' ')[0]),
                  icon: const Icon(Icons.edit),
                ),
              ),
            ),
            const SizedBox(height: 50)
            //DataTable(columns: columns, rows: rows)
          ],
        ),
      ),
    );
  }
}

/* class Data {
  String name;
  int rn;
  bool att;
  Data({this.name, this.rn, this.att});
}
var data=<Data> [

] */
