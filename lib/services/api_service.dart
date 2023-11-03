import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/task.dart';

class ApiService {
  final String baseUrl;

  ApiService({required this.baseUrl});

  Future<List<Task>> fetchTasks() async {
    final response =
        await http.get(Uri.parse(baseUrl)).timeout(Duration(seconds: 10));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Task.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load tasks');
    }
  }
}
