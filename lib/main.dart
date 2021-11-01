import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'water_select.dart';
import 'view_water.dart';
import 'components/rectangle_thumb.dart';

void main() {
  runApp(const WaterLevelApp());
}

class WaterLevelApp extends StatefulWidget {
  const WaterLevelApp({Key? key}) : super(key: key);

  @override
  State<WaterLevelApp> createState() => _WaterLevelAppState();
}

class _WaterLevelAppState extends State<WaterLevelApp> {
  // IO.Socket socket = IO.io(
  //     'http://localhost:3000',
  //     IO.OptionBuilder()
  //         .setTransports(['websocket']).build()); // localhost backend

  IO.Socket socket = IO.io(
      'https://ansyncflutterbackend.dulanvee.repl.co',
      IO.OptionBuilder()
          .setTransports(['websocket']).build()); // Deloyed Replit backend

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
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 0),
            trackShape: const RectangularSliderTrackShape(),
            // thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 17),
            thumbShape: RectangleThumb(10.0, 50.0),
            // trackShape: RoundedRectSliderTrackShape()
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => WaterSelect(socket),
          '/view': (context) => WaterView(socket),
        });
  }
}
