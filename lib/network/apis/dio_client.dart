import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DioClient {
  final _dio = Dio();

  DioClient() {
    _dio.options.baseUrl = "https://reqres.in/api";
  }

  Future<Response> login(Map<String, dynamic> userData) async {
    try {
      final response = await _dio.post("/login", data: userData);
      return response;
    } catch (e) {
      throw Exception("$e");
    }
  }

  Future<Response> register(Map<String, dynamic> userData) async {
    try {
      final response = await _dio.post("/register", data: userData);
      return response;
    } catch (e) {
      throw Exception("Something went wrong!!");
    }
  }

  Future<Response> getUsersList() async {
    try {
      final response = await _dio.get("/users");
      return response;
    } catch (e) {
      throw Exception("Something went wrong!!");
    }
  }
}

final dioClientProvider = Provider.autoDispose<DioClient>((ref) {
  final dio = DioClient();
  ref.onDispose(() => dio);
  return dio;
});
