import 'package:flutter/material.dart';

class StatelessSlider extends StatelessWidget {
  // final Function(double changed) updateLevel;
  // StatelessSlider(this.updateLevel, {Key? key}) : super(key: key);

  StatelessSlider({Key? key}) : super(key: key);

  // Create a ValueNotifier
  final ValueNotifier<double> _sliderValue = ValueNotifier<double>(0);

  @override
  Widget build(BuildContext context) {
    // Trigger slider widget rebuild whenever underlying slider material widget is changed using ValueListenableBuilder
    return ValueListenableBuilder(
        valueListenable: _sliderValue,
        builder: (BuildContext context, double valueNum, Widget? child) {
          return SizedBox(
              width: 300,
              child: Slider(
                value: valueNum,
                onChanged: (newLevel) {
                  // updateLevel(newLevel);
                  _sliderValue.value = newLevel;
                },
              ));
        });
  }
}
