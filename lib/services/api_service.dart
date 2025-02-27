import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class ApiService {
  static const String baseUrl = 'https://your-api-url.com';

  static Future<List<User>> getNearbyParamedics(double lat, double lng) async {
    final response = await http.get(
      Uri.parse('$baseUrl/paramedics?lat=$lat&lng=$lng'),
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load paramedics');
    }
  }

  // Add more API methods here
}
