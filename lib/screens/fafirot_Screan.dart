import 'package:flutter/material.dart';
import 'package:travelapp/models/trip.dart';
import 'package:travelapp/screens/trip_item.dart';

class FafirotScrean extends StatelessWidget {
  final List<Trip> faferttrapss;

  const FafirotScrean({super.key, required this.faferttrapss});

  @override
  Widget build(BuildContext context) {
    if (faferttrapss.isEmpty) {
      print("object isEmpty");
      return Center(child: Text("ليس هناك رحلات في قائمة المفضلة"));
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return TripItem(
            id: faferttrapss![index].id,
            title: faferttrapss![index].title,
            imageUrl: faferttrapss![index].imageUrl,
            duration: faferttrapss![index].duration,
            tripType: faferttrapss![index].tripType,
            season: faferttrapss![index].season,
            // removeitem: __removeTrip,
          );
        },
        itemCount: faferttrapss?.length ?? 0,
      );
    }
  }
}
