import 'package:http/http.dart' as http;
import 'dart:convert';

// Get water level from backend
Future<double> fetchLevel() async {
  final response = await http.get(Uri.parse('http://localhost:3000'));
  if (response.statusCode == 200) {
    // 200 means the response is okay, so get the body and return it
    // response.body is a JSON string, so decode into a map to extract the value from it
    Map jsonMap = json.decode(response.body);
    return jsonMap['waterlevel'];
  } else {
    throw Exception('Failed to get water level');
  }
}
