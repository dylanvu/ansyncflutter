import 'package:flutter/material.dart';

// Use CustomPaint to draw the water cup shape and fill it in
class WaterCup extends StatefulWidget {
  const WaterCup({Key? key}) : super(key: key);

  @override
  State<WaterCup> createState() => _WaterCupState();
}

class _WaterCupState extends State<WaterCup> {
  double _waterLevel = 0;
  String _waterLevelstr = "0%";

  void _setWaterlevel(newLevel) {
    setState(() {
      _waterLevel = newLevel;
      // Also set the string state
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
    return Container(
        child: Center(
            child: Column(
      children: <Widget>[
        CustomPaint(
          size: const Size(400, 400),
          painter: LinePainter(_waterLevel),
        ),
        Text(_waterLevelstr),
        const SizedBox(height: 20),
        TextButton(
            onPressed: () {
              if (_waterLevel > 0.99) {
                _setWaterlevel(0);
              } else {
                _setWaterlevel(_waterLevel + 0.1);
              }
            },
            child: const Text("Watch me rise")),
      ],
    )));
  }
}

class LinePainter extends CustomPainter {
  double percentage;
  // Construtor
  LinePainter(this.percentage);

  @override
  void paint(Canvas canvas, Size size) {
    // Create our painter objects, with a color and a brush size and styles
    var cupPaint = Paint()
      ..color = Colors.grey.shade700
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;

    var waterPaint = Paint()
      // .. is "cascade notation" to basically simplify repeated calls to the same thing, like Paint().color and Paint().strokeWidth
      ..color = Colors.indigo.shade200
      ..strokeWidth = 10
      ..style = PaintingStyle.fill;

    double cupWidthEdge = 60;
    double cupBottomlength = 60;
    double cupHeight = 200;

    // Define all the relevant coordiantes we'll need for the cup
    // Pick where to start the bottom of the cup
    double middleX = size.width / 2;
    double middleY = size.height / 1.05;

    double bottomLeftX = middleX - cupBottomlength;
    double bottomLeftY = middleY;

    double bottomRightX = middleX + cupBottomlength;
    double bottomRightY = middleY;

    double topLeftX = bottomLeftX - cupWidthEdge;
    double topLeftY = middleY - cupHeight;

    double topRightX = bottomRightX + cupWidthEdge;
    double topRightY = middleY - cupHeight;

    // Determine the left and right slopes to control water level
    double leftSlope = (bottomLeftY - topLeftY) / (topLeftX - bottomLeftX);
    double rightSlope = (topRightY - bottomRightY) / (topRightX - bottomRightX);

    // Fill in the cup with water
    var path = Path();
    // Start at the middle of the cup
    path.moveTo(middleX, middleY);
    // Go to bottom left of cup
    path.lineTo(bottomLeftX, middleY);

    // Top left edge of water
    path.lineTo(bottomLeftX - (percentage * cupWidthEdge),
        leftSlope * (percentage * cupWidthEdge) + bottomLeftY);

    // If the water is full, then fill in the top of the cup with water
    // TODO: Modify percentage threshold
    if (percentage > 0.99) {
      Rect cupOpeningtop =
          Offset(topLeftX, topLeftY - 25) & Size((topRightX - topLeftX), 50.0);
      path.arcTo(cupOpeningtop, 3.14, 3.14, false);
    } else {
      // Go across the cup
      path.lineTo(middleX + cupBottomlength + (percentage * cupWidthEdge),
          leftSlope * (percentage * cupWidthEdge) + bottomLeftY);
    }

    // Go to bottom right of cup
    path.lineTo(middleX + cupBottomlength, middleY);
    // Go back to middle
    path.lineTo(middleX, middleY);

    // Now actually draw the water on the canvas
    canvas.drawPath(path, waterPaint);

    // Draw the cup outline using the canvas object
    // Determine the start and end of cup bottom and draw from the center
    Offset bottomMiddle = Offset(middleX, middleY);
    Offset bottomLeft = Offset(bottomLeftX, bottomLeftY);
    Offset bottomRight = Offset(bottomRightX, bottomRightY);
    canvas.drawLine(bottomMiddle, bottomLeft, cupPaint);
    canvas.drawLine(bottomMiddle, bottomRight, cupPaint);

    // Draw the edges of the top of the cup
    // Right top edge
    Offset topRight = Offset(topRightX, topRightY);
    canvas.drawLine(bottomRight, topRight, cupPaint);

    // Left top edge
    Offset topLeft = Offset(topLeftX, topLeftY);
    canvas.drawLine(bottomLeft, topLeft, cupPaint);

    // Draw the oval top
    Rect cupOpeningtop =
        Offset(topLeftX, topLeftY - 25) & Size((topRightX - topLeftX), 50.0);
    canvas.drawArc(cupOpeningtop, 3.14, 3.14, false, cupPaint);

    // Draw the oval bottom
    Rect cupOpeningbottom =
        Offset(topLeftX, topLeftY - 25) & Size((topRightX - topLeftX), 50.0);
    canvas.drawArc(cupOpeningbottom, 3.14, -3.14, false, cupPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
