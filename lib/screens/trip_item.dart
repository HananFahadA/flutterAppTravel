import 'package:flutter/material.dart';
import 'package:travelapp/screens/trip_detail_screen.dart';
import '../models/trip.dart';

class TripItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final TripType tripType;
  // final Function removeitem;
  Season season;

  TripItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.tripType,
    required this.season,
    // required this.removeitem
  });

  String get seasonText {
    if (season == Season.Winter) return "شتاء";
    if (season == Season.Spring) return "ربيع";
    if (season == Season.Autumn) return "خريف";
    if (season == Season.Summer) return "صيف";
    // Add more conditions for other seasons if needed
    return "Unknown Season"; // Default if the season is not recognized
  }

  String get tripTypeText {
    if (tripType == TripType.Activities) return "أنشطة";
    if (tripType == TripType.Exploration) return "استكشاف";
    if (tripType == TripType.Recovery) return "استرخاء";
    if (tripType == TripType.Therapy) return "علاج";
    // Add more conditions for other trip types if needed
    return "Unknown TripType"; // Default if the trip type is not recognized
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Uncomment this when you have a defined TripDetailScreen
        Navigator.of(context)
                .pushNamed(TripDetailScreen.screenRoute, arguments: id)
            //     .then((value) {
            //   // if (value != null)

            //   // removeitem(value);
            // })

            ;
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 7,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  height: 250,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0.8),
                      ],
                      stops: [0.6, 1],
                    ),
                  ),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.headline6,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.today,
                        color: Colors.amber,
                      ),
                      SizedBox(width: 6),
                      Text('$duration ايام'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.wb_sunny,
                        color: Colors.amber,
                      ),
                      SizedBox(width: 6),
                      Text('$seasonText '),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.family_restroom,
                        color: Colors.amber,
                      ),
                      SizedBox(width: 6),
                      Text('$tripTypeText '),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
