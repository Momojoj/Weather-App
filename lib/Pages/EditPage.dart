import 'package:flutter/material.dart';
import 'package:weather_app/Components/Form/EditForm.dart';

class Editpage extends StatefulWidget {
  final String doc_id;
  final double heat;
  final double moister;
  const Editpage(
      {required this.heat, required this.moister, required this.doc_id});

  @override
  State<Editpage> createState() => _EditpageState();
}

class _EditpageState extends State<Editpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 239, 245, 255),
        title: Row(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'weather',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: const Color.fromARGB(255, 35, 34, 124)),
            ),
            Icon(
              Icons.sunny,
              color: const Color.fromARGB(255, 35, 34, 124),
            )
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'แก้ไขข้อมูลสภาพอากาศ',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromARGB(255, 18, 39, 143)),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Editform(
              heat: widget.heat,
              moister: widget.moister,
              doc_id: widget.doc_id,
            ),
          )
        ],
      ),
    );
    ;
  }
}
