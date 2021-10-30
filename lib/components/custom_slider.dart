// import 'package:flutter/material.dart';

// class CustomSlider extends SliderComponentShape {
//   final double thumbRadius;
//   final thumbHeight;
//   final int min;
//   final int max;

//   const CustomSlider({
//     this.thumbRadius,
//     this.thumbHeight,
//     this.min,
//     this.max,
//   });

//   @override
//     Size getPreferredSize(bool isEnabled, bool isDiscrete) {
//       return Size.fromRadius(thumbRadius);
//     }

//   @override
//   void paint(
//     PaintingContext context,
//     Offset center, {
//           Animation<double> activationAnimation,
//           Animation<double> enableAnimation,
//           bool isDiscrete,
//           TextPainter labelPainter,
//           RenderBox parentBox,
//           SliderThemeData sliderTheme,
//           TextDirection textDirection,
//           double value,
//           double textScaleFactor,
//           Size sizeWithOverflow,
//     }
//   ) {
//     final Canvas canvas = context.canvas;

//     final rRect = RRect.fromRectAndRadius(
//         Rect.fromCenter(
//             center: center, width: thumbHeight * 1.2, height: thumbHeight * .6),
//         Radius.circular(thumbRadius * .4),
//     );

//     final paint = Paint()
//       ..color = sliderTheme.activeTrackColor //Thumb Background Color
//       ..style = PaintingStyle.fill;
//   }

// }