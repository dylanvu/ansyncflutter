import 'package:http/http.dart' as http;
import 'dart:convert';

// Get water level from backend
Future<double> fetchLevel() async {
  final response = await http.get(Uri.parse('http://localhost:3000'));
  if (response.statusCode == 200) {
    // 200 means the response is okay, so get the body and return it
    // The body is a string of a double
    return double.parse(response.body);
  } else {
    throw Exception('Failed to get water level');
  }
}
