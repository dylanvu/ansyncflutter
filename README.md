# Water Level App

A Water Level Monitoring App developed for Ansync. The app works on the web view and on Android only and requires the associated backend. The backend is currently deployed to Replit, and is identical to the provided code in the repository.

Please note that I have provided my Firebase credentials in the json to enable the technical team to run the application for themselves.

If you want to run the backend locally, use the web version of the application and follow the following steps:
1. Modify the following lines of code inside of the `ansyncflutter` folder:
   * `ansyncflutter/lib/main.dart`: Make sure `IO.Socket socket` state points to `'http://localhost:3000'` and not `'https://ansyncflutterbackend.dulanvee.repl.co'`
   * `ansyncflutter/lib/scripts/fetch_level.dart`: Make sure the `Uri.parse()` is parsing `'http://localhost:3000'` and not `'https://ansyncflutterbackend.dulanvee.repl.co'`
   * `ansyncflutter/lib/scripts/post_level.dart`: Make sure the `Uri.parse()` is parsing `'http://localhost:3000'` and not `'https://ansyncflutterbackend.dulanvee.repl.co'`
2. Ensure that the backend packages are installed by running `npm install` inside the backend directory
3. Run `node server.js` in the backend
4. Launch the Flutter frontend using a web browser such as Chrome.

I opted for a Node.js backend and used HTTP requests and socket.io to get the data to the Flutter frontend.

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
* ValueNotifier: https://medium.com/flutterdevs/exploring-valuelistenablebuilder-in-flutter-9a16fc4c4c5b
* Reoccuring function: https://stackoverflow.com/questions/14946012/how-do-i-run-a-reoccurring-function-in-dart

## Resources Used - Backend
* Firestore Quickstart: https://firebase.google.com/docs/firestore/quickstart
* Setting up Firestore on NodeJS: https://firebase.google.com/docs/admin/setup
* Getting Data from Firestore: https://firebase.google.com/docs/firestore/query-data/get-data
* Firestore listener: https://firebase.google.com/docs/firestore/query-data/listen

## Areas of Improvement
* Figuring out FlutterFire to cut out the need for a dedicated NodeJS backend and setting up the cloud listener
* Only render components after requests to prevent the initial change from 0% water to the desired percentage, possibly using FutureBuilder
* Figuring out a way to pass the sockets more efficiently to the water_cup component using state management libraries
* Method for seamlessly running the backend locally without having to modify frontend code?
* Flutter buttons staying on the same height between pages
* Flutter slider track should have rounded corners