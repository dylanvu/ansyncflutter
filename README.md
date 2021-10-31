# Water Level App

A Water Level Monitoring App developed for Ansync. The app works on the web view and on Android only and requires the associated backend to work correctly.

The backend is currently deployed to Replit, and is identical to the provided code.

FlutterFire was attempted to be used, but there were some errors with connecting to Firebase, which is why I opted for a Node.js backend instead and used HTTP requests to get the data.

## Resouces Used - Frontend
* Setting Color Shades: https://stackoverflow.com/questions/49319333/how-do-i-use-the-different-shades-of-a-color-swatch-in-flutter
* Learning Custom Paint: https://blog.logrocket.com/drawing-shapes-in-flutter-with-custompaint-and-shape-maker/
* Creating Themes: https://api.flutter.dev/flutter/material/SliderThemeData-class.html
* HTTP Get: https://flutter.dev/docs/cookbook/networking/fetch-data
* JSON String to Map: https://stackoverflow.com/questions/49651673/converting-string-to-map-in-dart
* HTTP Post: https://flutter.dev/docs/cookbook/networking/send-data
* Custom Slider: https://blog.logrocket.com/flutter-slider-widgets-deep-dive-with-examples/

## Resources Used - Backend
* Firestore Quickstart: https://firebase.google.com/docs/firestore/quickstart
* Setting up Firestore on NodeJS: https://firebase.google.com/docs/admin/setup
* Getting Data from Firestore: https://firebase.google.com/docs/firestore/query-data/get-data