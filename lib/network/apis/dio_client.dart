import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/list_response.dart';
import '../../models/login_response.dart';
import '../../models/user_data.dart';

class DioClient {
  final _dio = Dio();
  // final _baseUrl = "https://reqres.in/api";

  DioClient() {
    _dio.options.baseUrl = "https://reqres.in/api";
  }

  Future<LoginResponse> login(Map<String, dynamic> userData) async {
    // Uri uri = Uri.parse("https://reqres.in/api/login");
    try {
      final response = await _dio.post("/login", data: userData);

      if (response.statusCode == 200) {
        final body = response.data;
        // print("Login body is $body");
        return LoginResponse.fromJson(body);
      } else {
        // print("Login error is${response.statusMessage}");
        throw Exception("Something went wrong!!");
      }
    } catch (e) {
      // print("Login error is $e");
      throw Exception("$e");
    }
  }

  Future<LoginResponse> register(Map<String, dynamic> userData) async {
    try {
      final response = await _dio.post("/register", data: userData);

      // print("Response Status code is ${response.statusCode}");
      if (response.statusCode == 200) {
        final body = response.data;
        // print("Body is ${LoginResponse.fromJson(body)}");
        return LoginResponse.fromJson(body);
      } else {
        // print("Error is there");
        throw Exception("Something went wrong!!");
      }
    } catch (e) {
      // print("Dio Error $e");
      throw Exception("Something went wrong!!");
    }
  }

  Future<List<UserData>?> getUsersList() async {
    try {
      final response = await _dio.get("/users");

      // print("Response Status code is ${response.statusCode}");
      if (response.statusCode == 200) {
        final body = response.data;
        final result = ListResponse.fromJson(body).data;
        // print("Body is ${ListResponse.fromJson(body)}");
        return result;
      } else {
        // print("Error is there");
        throw Exception("Something went wrong!!");
      }
    } catch (e) {
      // print("Dio Error $e");
      throw Exception("Something went wrong!!");
    }
  }
}

final dioClientProvider = Provider<DioClient>((ref) {
  final dio = DioClient();
  return dio;
});
