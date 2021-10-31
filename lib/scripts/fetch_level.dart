import 'package:http/http.dart' as http;

// Get water level from backend
Future<double> fetchLevel() async {
  // final response = await http.get(Uri.parse('http://localhost:3000'));  // For localhost backend hosting on the web
  final response = await http.get(Uri.parse(
      'https://ansyncflutterbackend.dulanvee.repl.co')); // Deployed backend on Replit
  if (response.statusCode == 200) {
    // 200 means the response is okay, so get the body and return it
    // The body is a string of a double
    return double.parse(response.body);
  } else {
    throw Exception('Failed to get water level');
  }
}
