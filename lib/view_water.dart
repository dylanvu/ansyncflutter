import 'package:flutter/material.dart';
import 'components/water_cup.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;

class WaterView extends StatefulWidget {
  WaterView(this.socket, {Key? key}) : super(key: key);

  IO.Socket socket;

  @override
  State<WaterView> createState() => _WaterViewState(socket);
}

class _WaterViewState extends State<WaterView> {
  _WaterViewState(this.socket);

  IO.Socket socket;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Center(child: Text("Water Level App"))),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              WaterCup(socket),
              SizedBox(
                child: TextButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/', (_) => false);
                    },
                    child: const Text("Prev Page")),
              )
            ],
          ),
        ));
  }
}
