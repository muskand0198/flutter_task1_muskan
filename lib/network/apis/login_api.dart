import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/login_response.dart';

class LoginApi {
  Future<LoginResponse> login(Map<String, dynamic> userData) async {
    Uri uri = Uri.parse("https://reqres.in/api/login");
    final response = await http.post(uri, body: userData);

    if (response.statusCode == 200) {
      final body = response.body;
      return LoginResponse.fromJson(jsonDecode(body));
    } else {
      throw Exception("Something went wrong!!");
    }
  }
}