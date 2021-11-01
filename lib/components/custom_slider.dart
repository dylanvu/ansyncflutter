import 'package:flutter/material.dart';

class StatelessSlider extends StatelessWidget {
  ValueNotifier parentNotifier;
  StatelessSlider(this.parentNotifier, {Key? key}) : super(key: key);

  // StatelessSlider({Key? key}) : super(key: key);

  // Create a ValueNotifier
  final ValueNotifier<double> _sliderValue = ValueNotifier<double>(0);

  @override
  Widget build(BuildContext context) {
    _sliderValue.value = parentNotifier.value;

    // Trigger slider widget rebuild whenever underlying slider material widget is changed using ValueListenableBuilder
    return ValueListenableBuilder(
        valueListenable: _sliderValue,
        builder: (BuildContext context, double valueNum, Widget? child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                  width: 300,
                  child: Slider(
                    value: valueNum,
                    onChanged: (newLevel) {
                      parentNotifier.value = newLevel;
                      _sliderValue.value = newLevel;
                    },
                  )),
              const SizedBox(height: 10),
              Text(
                (_sliderValue.value * 100).toStringAsFixed(0) + '%',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.grey.shade800,
                ),
              ),
            ],
          );
        });
  }
}
