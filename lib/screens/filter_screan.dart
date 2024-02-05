import 'package:flutter/material.dart';
import 'package:travelapp/screens/Appdrawer.dart';

class FilterScrean extends StatefulWidget {
  static const ScreanRoute = "/FilterScrean";
  final Function savefilter;
  final Map<String, bool> curentmap;

  const FilterScrean(
      {super.key, required this.savefilter, required this.curentmap});

  @override
  State<FilterScrean> createState() => _FilterScreanState();
}

class _FilterScreanState extends State<FilterScrean> {
  // Define boolean variables for filtering options
  var _summer1 = false;
  var _family1 = false;
  var _winter1 = false;

  @override
  void initState() {
    _summer1 = widget.curentmap['Summer'] ?? false;
    ;
    _family1 = widget.curentmap['Families'] ?? false;
    ;
    _winter1 = widget.curentmap['Winter'] ?? false;
    ;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("دليل سياحي", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectefilter = {
                "Summer": _summer1,
                "Families": _family1,
                "Winter": _winter1,
              };

              widget.savefilter(selectefilter);
            },
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 50),
          Expanded(
            child: ListView(
              children: [
                // SwitchListTile for summer trips
                buildSwitchListTile(
                  'الرحلات الصيفية فقط',
                  'إظهار الرحلات في فصل الصيف فقط',
                  _summer1,
                  (newValue) {
                    setState(() {
                      _summer1 = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  'الرحلات الشتوية فقط',
                  'إظهار الرحلات في فصل الشتاء فقط',
                  _winter1,
                  (newValue2) {
                    setState(() {
                      _winter1 = newValue2;
                    });
                  },
                ),
                buildSwitchListTile(
                  'للعائلات',
                  'إظهار الرحلات التي للعائلات فقط',
                  _family1,
                  (newValue3) {
                    setState(() {
                      _family1 = newValue3;
                    });
                  },
                ),
                // Add more SwitchListTile widgets for other filtering options as needed
              ],
            ),
          ),
        ],
      ),
      drawer: Appdrawer(),
    );
  }

  Widget buildSwitchListTile(String title, String subtitle, bool currentValue,
      ValueChanged<bool>? updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentValue,
      onChanged: updateValue,
    );
  }
}
