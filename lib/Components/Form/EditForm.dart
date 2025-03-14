import 'package:flutter/material.dart';
import 'package:weather_app/service/crud_service.dart';

class Editform extends StatefulWidget {
  final String doc_id;
  final double heat;
  final double moister;
  Editform({required this.heat, required this.moister, required this.doc_id});

  @override
  State<Editform> createState() => _EditformState();
}

class _EditformState extends State<Editform> {
  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final heatController = TextEditingController(text: widget.heat.toString());
    final moistureController =
        TextEditingController(text: widget.moister.toString());

    void handleSubmit() {
      var heat = heatController.text;
      var moister = moistureController.text;

      updateData(widget.doc_id, double.parse(heat), double.parse(moister));
      Navigator.pop(context);
      // addData(province, district, double.parse(heat), double.parse(moister));
    }

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
                  "อัพเดตข้อมูล",
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
