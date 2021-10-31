import 'package:http/http.dart' as http;
import 'dart:convert';

Future<bool> postLevel(newLevel) async {
  // final response = await http.post(
  //   Uri.parse('http://localhost:3000'),
  //   headers: <String, String>{
  //     'Content-Type': 'application/json; charset=UTF-8',
  //   },
  //   body: json.encode(<String, double>{'newlevel': newLevel}),
  // ); // For localhost backend

  final response = await http.post(
    Uri.parse('https://ansyncflutterbackend.dulanvee.repl.co'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: json.encode(<String, double>{'newlevel': newLevel}),
  ); // Deployed backend on Replit

  if (response.statusCode != 201) {
    print("Failed to update water level");
    return false;
  }
  return true;
}
