import 'dart:convert';
import 'package:flutter_task1_muskan/models/login_response.dart';
import 'package:http/http.dart' as http;
import '../../models/user_data.dart';

class RegisterApi {
  Future<LoginResponse> register(Map<String, dynamic> userData) async {
    Uri uri = Uri.parse("https://reqres.in/api/register");
    final response = await http.post(uri, body: userData);

    if (response.statusCode == 200) {
      final body = response.body;
      return LoginResponse.fromJson(jsonDecode(body));
    } else {
      throw Exception("Something went wrong!!");
    }
  }
}

