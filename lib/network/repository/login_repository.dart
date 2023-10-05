import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task1_muskan/network/apis/dio_client.dart';
import '../../models/login_response.dart';

class LoginRepository {
  LoginRepository({required this.dioClient});

  final DioClient dioClient;

  Future<LoginResponse> login(Map<String, dynamic> data) async {
    try {
      final response = await dioClient.login(data);

      if (response.statusCode == 200) {
        final body = response.data;
        return LoginResponse.fromJson(body);
      } else {
        throw Exception("Something went wrong!!");
      }
    } catch (e) {
      throw Exception("Something went wrong!!");
    }
  }
}

final loginRepositoryProvider = Provider.autoDispose<LoginRepository>((ref) {
  final loginRepo = LoginRepository(dioClient: ref.watch(dioClientProvider));
  ref.onDispose(() => loginRepo);
  return loginRepo;
});
