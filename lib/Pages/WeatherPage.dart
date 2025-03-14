import 'package:flutter/material.dart';
import 'package:weather_app/Components/WeatherList.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text("รายการสภาพอากาศ",
              style: TextStyle(
                  color: const Color.fromARGB(255, 18, 39, 143),
                  fontSize: 30,
                  fontWeight: FontWeight.w500)),
          SizedBox(
            height: 20,
          ),
          Weatherlist()
        ],
      ),
    );
  }
}
