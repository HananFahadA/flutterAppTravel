import 'package:flutter/material.dart';
import 'package:travelapp/screens/category_trips_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String id;
  CategoryItem(this.title, this.imageUrl, this.id);

// .categoryid, required this.categorytitle
  void select(BuildContext context) {
    Navigator.of(context).pushNamed(CategoryTripsScreen.ScreanRoute,
        arguments: {'categoryid': id, 'categorytitle': title});

    // MaterialPageRoute(
    //   builder: (context) =>
    //       CategoryTripsScreen(categoryid: this.id, categorytitle: this.title),
    // ),
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => select(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              this.imageUrl,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text(
              this.title,
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black.withOpacity(0.5)),
          )
        ],
      ),
    );
  }
}
