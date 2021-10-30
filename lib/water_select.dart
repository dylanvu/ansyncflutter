import 'package:flutter/material.dart';

class WaterSelect extends StatefulWidget {
  const WaterSelect({Key? key}) : super(key: key);

  @override
  State<WaterSelect> createState() => _WaterSelectState();
}

class _WaterSelectState extends State<WaterSelect> {
  // Water specific states
  double _waterLevel = 0;
  String _waterLevelstr = "0%";
  // TODO: The slider resets after moving to another page. Use a useEffect type of thing to pull it from the database?
  void _setWaterlevel(newLevel) {
    setState(() {
      _waterLevel = newLevel;
      _setWaterlevelStr(newLevel);
    });
  }

  // Use this state function to obtain a formatted string of percentages from the slider
  void _setWaterlevelStr(newLevel) {
    setState(() {
      String newString = (newLevel * 100).toStringAsFixed(0);
      _waterLevelstr = newString + '%';
    });
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
