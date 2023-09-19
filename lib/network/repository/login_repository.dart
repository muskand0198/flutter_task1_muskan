import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task1_muskan/network/apis/dio_client.dart';
import '../../models/login_response.dart';

class LoginRepository{

  Future<LoginResponse> login(Map<String, dynamic> data){
    try {
      return DioClient().login(data);
    }catch(e){
      throw Exception("Something went wrong!!");
    }
  }
}

final loginRepositoryProvider = Provider<LoginRepository>((ref) {
  return LoginRepository();
});