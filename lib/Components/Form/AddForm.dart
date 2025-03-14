import 'package:flutter/material.dart';
import 'package:weather_app/service/crud_service.dart';

class AddFrom extends StatefulWidget {
  const AddFrom({super.key});

  @override
  State<AddFrom> createState() => _AddFromState();
}

class _AddFromState extends State<AddFrom> {
  final key = GlobalKey<FormState>();
  final provinceController = TextEditingController();
  final districtController = TextEditingController();
  final heatController = TextEditingController();
  final moistureController = TextEditingController();

  void handleSubmit() {
    var province = provinceController.text;
    var district = districtController.text;
    var heat = heatController.text;
    var moister = moistureController.text;
    addData(province, district, double.parse(heat), double.parse(moister));
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          spacing: 15,
          children: [
            Column(
              spacing: 10,
              crossAxisAlignment:
                  CrossAxisAlignment.start, // กำหนดให้ Text อยู่ทางซ้าย
              children: [
                Text(
                  'จังหวัด',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextFormField(
                  controller: provinceController,
                  autofocus: false,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.location_on),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "ชื่อจังหวัด",
                      errorStyle: TextStyle(
                          color: Colors.yellow,
                          fontSize: 14,
                          fontWeight: FontWeight.bold)),
                  validator: (value) {
                    if (value!.isEmpty) return 'กรุณาใส่จังหวัด';
                  },
                ),
              ],
            ),
            Column(
              spacing: 10,
              crossAxisAlignment:
                  CrossAxisAlignment.start, // กำหนดให้ Text อยู่ทางซ้าย
              children: [
                Text(
                  'เขต/อำเภอ',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextFormField(
                  controller: districtController,
                  autofocus: false,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.location_city),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "ชื่อเขต/อำเภอ",
                      errorStyle: TextStyle(
                          color: Colors.yellow,
                          fontSize: 14,
                          fontWeight: FontWeight.bold)),
                  validator: (value) {
                    if (value!.isEmpty) return 'กรุณาใส่เขต/อำเภอ';
                  },
                ),
              ],
            ),
            Column(
              spacing: 10,
              crossAxisAlignment:
                  CrossAxisAlignment.start, // กำหนดให้ Text อยู่ทางซ้าย
              children: [
                Text(
                  'อุณหภูมิ °C',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextFormField(
                  controller: heatController,
                  autofocus: false,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.device_thermostat),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "กรอกเป็นตัวเลข",
                      errorStyle: TextStyle(
                          color: Colors.yellow,
                          fontSize: 14,
                          fontWeight: FontWeight.bold)),
                  validator: (value) {
                    if (value!.isEmpty) return 'กรุณาใส่อุณหภูมิ';
                  },
                ),
              ],
            ),
            Column(
              spacing: 10,
              crossAxisAlignment:
                  CrossAxisAlignment.start, // กำหนดให้ Text อยู่ทางซ้าย
              children: [
                Text(
                  'ความชื้น %',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextFormField(
                  controller: moistureController,
                  autofocus: false,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.water_drop),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "กรอกเป็นตัวเลข",
                      errorStyle: TextStyle(
                          color: Colors.yellow,
                          fontSize: 14,
                          fontWeight: FontWeight.bold)),
                  validator: (value) {
                    if (value!.isEmpty) return 'กรุณาใส่ความชื้น';
                  },
                ),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            Center(
              child: ElevatedButton(
                onPressed: handleSubmit,
                child: Text(
                  "เพิ่มข้อมูล",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                style: ButtonStyle(
                  fixedSize: WidgetStateProperty.all(Size(280, 50)),
                  backgroundColor: WidgetStateProperty.all(
                      Color.fromARGB(255, 54, 128, 208)),
                  foregroundColor: WidgetStateProperty.all(Colors.white),
                ),
              ),
            )
          ],
        ));
  }
}
