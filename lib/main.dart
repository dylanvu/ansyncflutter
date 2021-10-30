import 'package:flutter/material.dart';

import 'water_select.dart';
import 'view_water.dart';

void main() {
  runApp(const WaterLevelApp());
}

class WaterLevelApp extends StatelessWidget {
  const WaterLevelApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Water Level App',
        theme: ThemeData(
            primarySwatch: Colors.purple,
            textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.purple,
                ),
                foregroundColor: MaterialStateProperty.all<Color>(
                  Colors.white,
                ),
              ),
            ),
            sliderTheme: SliderThemeData(
              trackHeight: 30,
              activeTrackColor: Colors.indigo[200],
              inactiveTrackColor: Colors.grey[200],
              // overlayShape: const RoundSliderOverlayShape(overlayRadius: 20),
              trackShape: const RectangularSliderTrackShape(),
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 17),
              // trackShape: RoundedRectSliderTrackShape()
            )),
        initialRoute: '/',
        routes: {
          '/': (context) => const WaterSelect(),
          '/view': (context) => const WaterView(),
        });
  }
}
