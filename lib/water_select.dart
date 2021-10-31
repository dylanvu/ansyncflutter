import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './scripts/fetch_level.dart';

class WaterSelect extends StatefulWidget {
  const WaterSelect({Key? key}) : super(key: key);

  @override
  State<WaterSelect> createState() => _WaterSelectState();
}

class _WaterSelectState extends State<WaterSelect> {
  // Water specific states
  double _waterLevel = 0;
  String _waterLevelstr = "0%";
  // Future<double> _futureWaterlevel;

  // Get water level from backend
  // Future<double> fetchLevel() async {
  //   final response = await http.get(Uri.parse('http://localhost:3000'));
  //   if (response.statusCode == 200) {
  //     // 200 means the response is okay, so get the body and return it
  //     // response.body is a JSON string, so decode into a map to extract the value from it
  //     Map jsonMap = json.decode(response.body);
  //     return jsonMap['waterlevel'];
  //   } else {
  //     throw Exception('Failed to get water level');
  //   }
  // }

  // TODO: The slider resets after moving to another page. Use a useEffect type of thing to pull it from the database?
  void _setWaterlevel(newLevel) {
    setState(() {
      _waterLevel = newLevel;
      String newString = (newLevel * 100).toStringAsFixed(0);
      _waterLevelstr = newString + '%';
    });
  }

  @override
  void initState() {
    // Obtain the current water level from the database and set the slider to it
    fetchLevel().then((value) => {_setWaterlevel(value)});
    // Future<double> initialLevel = fetchLevel();
    // setState(() {
    //   _futureWaterlevel = initialLevel;
    // });
    // _setWaterlevel(initialLevel);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Center(child: Text("Water Level App"))),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              const Text("Select Water Level"),
              const SizedBox(height: 20),
              SizedBox(
                  width: 300,
                  child: Slider(
                    value: _waterLevel,
                    onChanged: (newLevel) {
                      _setWaterlevel(newLevel);
                    },
                  )),
              Text(_waterLevelstr),
              const SizedBox(
                  height: 20), // Use a SizedBox to control whitespace height
              SizedBox(
                child: TextButton(
                  child: const Text("Next Page"),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/view', (_) => false);
                  },
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                child: TextButton(
                  child: const Text("Push to Firestore"),
                  onPressed: () {
                    // Push to Firestore
                  },
                ),
              )
            ])));
  }
}
