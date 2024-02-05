import 'package:flutter/material.dart';
import 'package:travelapp/app_data.dart';

class TripDetailScreen extends StatelessWidget {
  static const screenRoute = "TripDetailScreen";
  final Function mangefiferat;

  final Function isfafrt;
  const TripDetailScreen(
      {super.key, required this.mangefiferat, required this.isfafrt});

  Container seletonTitle(String title, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      alignment: Alignment.topRight,
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }

  Container sectionData(BuildContext context, Widget widget) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(color: Colors.grey)),
      height: 200,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: widget,
    );
  }

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String;
    final seartraop = Trips_data.firstWhere((element) => element.id == id);
    return Scaffold(
      appBar: AppBar(
        title: Text(seartraop.title, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                seartraop.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            seletonTitle("الانشطة", context),
            sectionData(
                context,
                ListView.builder(
                  itemCount: seartraop.activities.length,
                  itemBuilder: (context, index) => Card(
                    elevation: 0.3,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Text(seartraop.activities[index]),
                    ),
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            seletonTitle("البرنامج اليومي", context),
            sectionData(
                context,
                ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text("يوم ${index + 1}"),
                      ),
                      title: Text(seartraop.program[index]),
                    );
                    Divider();
                  },
                  itemCount: seartraop.program.length,
                )),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => mangefiferat(id),
        child: Icon(isfafrt(id) ? Icons.star : Icons.star_border),
      ),
    );

    // Text(" $idصفجة تفتصي");
  }
}
