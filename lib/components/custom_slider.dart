import 'package:flutter/material.dart';

class RectangleThumb extends SliderComponentShape {
  final double thumbWidth;
  final double thumbHeight;

  RectangleThumb(this.thumbWidth, this.thumbHeight);

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size(thumbWidth, thumbHeight);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;
    var thumbPaint = Paint()
      // .. is "cascade notation" to basically simplify repeated calls to the same thing, like Paint().color and Paint().strokeWidth
      ..color = Colors.purple
      ..strokeWidth = 10
      ..style = PaintingStyle.fill;

    // Use the center parameter to ensure that the shape follows the actual position of the slider
    double centerX = center.dx;
    double centerY = center.dy;
    Rect sliderRect =
        Offset(centerX - thumbWidth / 2, centerY - thumbHeight / 2) &
            Size(thumbWidth, thumbHeight);
    canvas.drawRect(sliderRect, thumbPaint);
  }
}
