import 'package:flutter/material.dart';
import 'components/water_cup.dart';

class WaterView extends StatefulWidget {
  const WaterView({Key? key}) : super(key: key);

  @override
  State<WaterView> createState() => _WaterViewState();
}

class _WaterViewState extends State<WaterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Center(child: Text("Water Level App"))),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const WaterCup(),
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
