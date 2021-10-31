# Water Level App

A Water Level Monitoring App developed for Ansync. The app works on the web view and on Android only and requires the associated backend to work correctly.

The backend is currently deployed to Replit, and is identical to the provided code in the repository.

Using FlutterFire was attempted, but there were some errors with connecting to Firebase, which is why I opted for a Node.js backend instead and used HTTP requests and socket.io to get the data.

## Resouces Used - Frontend
* Setting Color Shades: https://stackoverflow.com/questions/49319333/how-do-i-use-the-different-shades-of-a-color-swatch-in-flutter
* Learning Custom Paint: https://blog.logrocket.com/drawing-shapes-in-flutter-with-custompaint-and-shape-maker/
* Creating Themes: https://api.flutter.dev/flutter/material/SliderThemeData-class.html
* HTTP Get: https://flutter.dev/docs/cookbook/networking/fetch-data
* JSON String to Map: https://stackoverflow.com/questions/49651673/converting-string-to-map-in-dart
* HTTP Post: https://flutter.dev/docs/cookbook/networking/send-data
* Custom Slider: https://blog.logrocket.com/flutter-slider-widgets-deep-dive-with-examples/
* Flutter Socket.io client documentation: https://pub.dev/packages/socket_io_client
* Flutter Socket.io client example: https://blog.codemagic.io/flutter-ui-socket/
* Flutter Socket.io invalid frame header connection error: https://stackoverflow.com/questions/43526607/invalid-frame-header and https://socket.io/docs/v4/server-options/#alloweio3
* Setting State on Disposed Widgets Error: https://stackoverflow.com/questions/52288613/how-to-dispose-of-my-stateful-widget-completely

## Resources Used - Backend
* Firestore Quickstart: https://firebase.google.com/docs/firestore/quickstart
* Setting up Firestore on NodeJS: https://firebase.google.com/docs/admin/setup
* Getting Data from Firestore: https://firebase.google.com/docs/firestore/query-data/get-data
* Firestore listener: https://firebase.google.com/docs/firestore/query-data/listen