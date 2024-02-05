import 'package:flutter/material.dart';
import 'package:travelapp/models/trip.dart';
import 'package:travelapp/screens/Appdrawer.dart';
import 'package:travelapp/screens/categories_screen.dart';
import 'package:travelapp/screens/fafirot_Screan.dart';
import 'package:travelapp/screens/filter_screan.dart';

class TabScereen extends StatefulWidget {
  final List<Trip> faferttrap;

  const TabScereen({super.key, required this.faferttrap});
  @override
  _TabScereenState createState() => _TabScereenState();
}

class _TabScereenState extends State<TabScereen> {
  void __selection(int index) {
    setState(() {
      __selectedindex = index;
    });
  }

  late List<Map<String, Object>> __screen;
  @override
  void initState() {
    // TODO: implement initState
    __screen = [
      {"screean": CategoriesScreen(), "title": "التصنيفات"},
      {
        "screean": FafirotScrean(faferttrapss: widget.faferttrap),
        "title": "المفضلة",
      }
    ];
    super.initState();
  }

  int __selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("دليل سياحي", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blue,
          centerTitle: true),
      body: __screen[__selectedindex]["screean"] as Widget,
      drawer: Appdrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: __selection,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Color.fromARGB(255, 10, 0, 0),
        currentIndex: __selectedindex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'التصنيفات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.start),
            label: 'المفضلة',
          ),
        ],
      ),
    );
  }
}

// Color.fromARGB(255, 126, 126, 126)ereen extends StatelessWidget {
//   const TabScereen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("دليل سياحي", style: TextStyle(color: Colors.white)),
//           backgroundColor: Colors.blue,
//           centerTitle: true,
//           bottom: TabBar(
//             tabs: [
//               Tab(
//                 icon: Icon(
//                   Icons.dashboard,
//                   color: Colors.white,
//                 ),
//                 text: "التصنيفات",
//               ),
//               Tab(
//                 icon: Icon(
//                   Icons.star,
//                   color: Colors.white,
//                 ),
//                 text: "المفضلة",
//               )
//             ],
//           ),
//         ),
//         body: TabBarView(children: [CategoriesScreen(), FafirotScrean()]),
//       ),
//     );
//   }
// }
