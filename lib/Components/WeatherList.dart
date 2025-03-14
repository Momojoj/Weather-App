import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/Pages/EditPage.dart';
import 'package:weather_app/service/crud_service.dart';

class Weatherlist extends StatefulWidget {
  const Weatherlist({super.key});

  @override
  State<Weatherlist> createState() => _WeatherlistState();
}

void handleDelete(String id) {
  deleteData(id);
}

class _WeatherlistState extends State<Weatherlist> {
  CollectionReference weatherCollection =
      FirebaseFirestore.instance.collection('Weather');

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder(
          stream: weatherCollection.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var weatherIndex = snapshot.data!.docs[index];

                  return ListTile(
                    leading: Icon(Icons.account_balance),
                    title: Text(weatherIndex["province"]),
                    subtitle: Text(weatherIndex["district"]),
                    trailing: Row(
                      spacing: 20,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          spacing: 5,
                          children: [
                            Text(
                              weatherIndex["heat"].toString(),
                              style: TextStyle(fontSize: 17),
                            ),
                            Text(
                              "°C",
                              style: TextStyle(fontSize: 17),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        IconButton(
                            onPressed: () {
                              handleDelete(weatherIndex.id);
                            },
                            icon: Icon(Icons.delete)),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Editpage(
                                    heat: weatherIndex["heat"],
                                    moister: weatherIndex["moister"],
                                    doc_id: weatherIndex.id,
                                  ),
                                ));
                          },
                          icon: Icon(Icons.edit),
                        )
                      ],
                    ),
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
