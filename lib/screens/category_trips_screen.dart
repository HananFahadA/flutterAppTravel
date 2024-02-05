import 'package:flutter/material.dart';
import 'package:travelapp/models/trip.dart';
import 'package:travelapp/screens/trip_item.dart';
import '../app_data.dart';

class CategoryTripsScreen extends StatefulWidget {
  static const ScreanRoute = "/CategoryTripsScreen";

  final List<Trip> avilabledata;

  const CategoryTripsScreen({super.key, required this.avilabledata});

  @override
  State<CategoryTripsScreen> createState() => _CategoryTripsScreenState();
}

class _CategoryTripsScreenState extends State<CategoryTripsScreen> {
  String? categorytitle;
  List<Trip>? displaytrip;

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    fetchData();
    super.didChangeDependencies();
  }

  void fetchData() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final categoryid = args['categoryid'];
    categorytitle = args['categorytitle'];

    // Update the state variable instead of creating a local variable
    displaytrip = widget.avilabledata.where((trip) {
      return trip.categories.contains(categoryid);
    }).toList();
    // Fetch data from a network or database if needed
    // Update the state if needed
  }

  @override
  Widget build(BuildContext context) {
    void __removeTrip(String trapid) {
      setState(() {
        displaytrip?.removeWhere((element) => element.id == trapid);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(categorytitle ?? "", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return TripItem(
            id: displaytrip![index].id,
            title: displaytrip![index].title,
            imageUrl: displaytrip![index].imageUrl,
            duration: displaytrip![index].duration,
            tripType: displaytrip![index].tripType,
            season: displaytrip![index].season,
            // removeitem: __removeTrip,
          );
        },
        itemCount: displaytrip?.length ?? 0,
      ),
    );
  }
}
