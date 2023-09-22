import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task1_muskan/network/apis/dio_client.dart';
import '../../models/login_response.dart';

class LoginRepository{

  LoginRepository({required this.dioClient});

  final DioClient dioClient;

  Future<LoginResponse> login(Map<String, dynamic> data){
    try {
      return dioClient.login(data);
    }catch(e){
      throw Exception("Something went wrong!!");
    }
  }
}

final loginRepositoryProvider = Provider<LoginRepository>((ref) {
  return LoginRepository(dioClient: ref.watch(dioClientProvider));
});