import 'package:http/http.dart' as http;
import 'dart:convert';

Future<bool> postLevel(newLevel) async {
  final response = await http.post(
    Uri.parse('http://localhost:3000'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: json.encode(<String, double>{'newlevel': newLevel}),
  );
  if (response.statusCode != 201) {
    throw Exception("Failed to update water level");
  }
  return true;
}
