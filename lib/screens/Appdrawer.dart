import 'package:flutter/material.dart';
import 'package:travelapp/screens/filter_screan.dart';

class Appdrawer extends StatelessWidget {
  const Appdrawer({
    super.key,
  });

  Widget buildtitle(String title, IconData icon, Function ontaplink) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
        color: Colors.blue,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontFamily: 'ElMessiri',
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () => ontaplink(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            color: Colors.amber,
            child: Text(
              "دليلك السياحي",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildtitle("الرحلات", Icons.card_travel,
              () => Navigator.of(context).pushNamed("/")),
          SizedBox(
            height: 20,
          ),
          buildtitle("الفلترة", Icons.filter_list,
              () => Navigator.of(context).pushNamed(FilterScrean.ScreanRoute)),
        ],
      ),
    );
  }
}
