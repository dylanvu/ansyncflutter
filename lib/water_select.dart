import 'package:flutter/material.dart';
import './scripts/fetch_level.dart';
import './scripts/post_level.dart';
import './components/custom_slider.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class WaterSelect extends StatefulWidget {
  WaterSelect(this.socket, {Key? key}) : super(key: key);

  IO.Socket socket;

  @override
  State<WaterSelect> createState() => _WaterSelectState(socket);
}

class _WaterSelectState extends State<WaterSelect> {
  _WaterSelectState(this.socket);

  // Socket state
  IO.Socket socket;

  // Post success/failure
  // This number can be either 0, 1, or 2 where 0 indicates a failed post operation, 1 indicates a successful one, and 2 indicates no post has been made yet
  int _post = 2;

  // Create a ValueNotifier
  final ValueNotifier<double> _sliderValue = ValueNotifier<double>(0);

  void _setPostStatus(number) {
    setState(() {
      _post = number;
    });
  }

  @override
  void initState() {
    // Obtain the current water level from the database and set the slider to it
    try {
      fetchLevel()
          .then((value) => {_sliderValue.value = value})
          .catchError((e) => print(e));
    } catch (e) {
      print(e);
    }
    socket.on(
        'updatewater',
        (_) => {
              fetchLevel()
                  .then((value) => {_sliderValue.value = value})
                  .catchError((e) => print(e))
            });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Center(child: Text("Water Level App"))),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              Text(
                "Select Water Level",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.grey.shade800,
                ),
              ),
              const SizedBox(height: 20),
              StatelessSlider(_sliderValue),
              const SizedBox(height: 20), // whitespace
              SizedBox(
                child: TextButton(
                  child: const Text("Next Page"),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/view', (_) => false);
                  },
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                child: TextButton(
                  child: const Text("Push to Firestore"),
                  onPressed: () {
                    postLevel(_sliderValue.value).then((value) => {
                          if (value)
                            {_setPostStatus(1)}
                          else
                            {_setPostStatus(0)}
                        });
                  },
                ),
              ),
              const SizedBox(height: 20),
              if (_post == 1)
                Text(
                  "Successfully pushed to Firestore",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.green.shade900,
                  ),
                ),
              if (_post == 0)
                Text(
                  "An Firebase error has occurred. Nothing was pushed.",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.red.shade900,
                  ),
                ),
            ])));
  }
}
