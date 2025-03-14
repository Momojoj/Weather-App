import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void addData(
    String province, String district, double heat, double moister) async {
  try {
    await FirebaseFirestore.instance.collection('Weather').add({
      "province": province,
      "district": district,
      "heat": heat,
      "moister": moister
    });
  } on Exception catch (e) {
    print(e);
  }
}

void updateData(String id, double heat, double moister) async {
  try {
    await FirebaseFirestore.instance
        .collection('Weather')
        .doc(id)
        .update({"heat": heat, "moister": moister});
  } on Exception catch (e) {
    print(e);
  }
}

void deleteData(String id) async {
  try {
    await FirebaseFirestore.instance.collection('Weather').doc(id).delete();
  } on Exception catch (e) {
    print(e);
  }
}
