import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task1_muskan/network/apis/dio_client.dart';
import '../../models/login_response.dart';

class RegisterRepository{

  Future<LoginResponse> register(Map<String, dynamic> data){
    try {
      return DioClient().register(data);
    }catch(e){
      throw Exception("Something went wrong!!");
    }
  }
}

final userRepositoryProvider = Provider<RegisterRepository>((ref) {
  return RegisterRepository();
});