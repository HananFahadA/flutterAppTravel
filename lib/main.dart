import 'package:flutter/material.dart';
import 'package:travelapp/app_data.dart';
import 'package:travelapp/models/trip.dart';
import 'package:travelapp/screens/categories_screen.dart';
// import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:travelapp/screens/category_trips_screen.dart';
import 'package:travelapp/screens/filter_screan.dart';
import 'package:travelapp/screens/tab_scereen.dart';
import 'package:travelapp/screens/trip_detail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> __filter = {
    "Summer": false,
    "Families": false,
    "Winter": false,
  };
  List<Trip> __avilable = Trips_data;
  List<Trip> _faferttrap = [];
  void __changefilterts(Map<String, bool> filterdata) {
    setState(() {
      __filter = filterdata;
      __avilable = Trips_data.where((trip) {
        if (__filter["Summer"] == true && trip.isInSummer != true) {
          print("Summer");
          return false;
        }
        if (__filter["Winter"] == true && trip.isInWinter != true) {
          print("Winter");
          return false;
        }
        if (__filter["Families"] == true && trip.isForFamilies != true) {
          print("Families");
          return false;
        }

        return true;
      }).toList();
    });
  }

  bool __isfafrt(String id) {
    return _faferttrap.any((trip) => trip.id == id);
  }

  void __mangefiferat(String tripid) {
    final indexexit = _faferttrap.indexWhere((trip) => trip.id == tripid);
    if (indexexit >= 0) {
      setState(() {
        _faferttrap.removeAt(indexexit);
      });
    } else {
      setState(() {
        _faferttrap.add(Trips_data.firstWhere((trip) => trip.id == tripid));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => TabScereen(faferttrap: _faferttrap),
        CategoryTripsScreen.ScreanRoute: (context) => CategoryTripsScreen(
              avilabledata: __avilable,
            ),
        TripDetailScreen.screenRoute: (context) =>
            TripDetailScreen(mangefiferat: __mangefiferat, isfafrt: __isfafrt),
        FilterScrean.ScreanRoute: (context) =>
            FilterScrean(curentmap: __filter, savefilter: __changefilterts)
      },
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ar', 'AE'), // English, no country code
      ],
      title: 'Travel App',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          // accentColor: Colors.amber,
          fontFamily: 'ElMessiri',
          textTheme: ThemeData.light().textTheme.copyWith(
                headline5: TextStyle(
                  color: Colors.blue,
                  fontSize: 24,
                  fontFamily: 'ElMessiri',
                  fontWeight: FontWeight.bold,
                ),
                headline6: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontFamily: 'ElMessiri',
                  fontWeight: FontWeight.bold,
                ),
              )),
    );
  }
}
