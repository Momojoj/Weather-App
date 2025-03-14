import 'package:flutter/material.dart';
import 'package:weather_app/Pages/FormPage.dart';
import 'package:weather_app/Pages/WeatherPage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectIndex = 0;
  List pageList = [WeatherPage(), Formpage()];

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
      body: pageList[_selectIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectIndex,
          onTap: (value) {
            setState(() {
              _selectIndex = value;
            });
          },
          backgroundColor: const Color.fromARGB(255, 228, 239, 255),
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: const Color.fromARGB(255, 30, 26, 148),
                ),
                label: 'home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.edit,
                  color: const Color.fromARGB(255, 30, 26, 148),
                ),
                label: 'add data'),
          ]),
    );
  }
}
