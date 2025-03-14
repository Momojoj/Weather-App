import 'package:flutter/material.dart';
import 'package:weather_app/Components/Form/AddForm.dart';

class Formpage extends StatefulWidget {
  Formpage({super.key});

  @override
  State<Formpage> createState() => _FormpageState();
}

class _FormpageState extends State<Formpage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'เพิ่มข้อมูลสภาพอากาศ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: AddFrom(),
          )
        ],
      ),
    );
  }
}
