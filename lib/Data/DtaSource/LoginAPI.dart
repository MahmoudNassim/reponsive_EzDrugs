import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String _baseUrl = 'https://api.ezdrug.tech/';

  Future<bool> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl//Account/Login'),
      body: jsonEncode({'email': email, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}