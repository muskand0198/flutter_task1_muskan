import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task1_muskan/network/apis/dio_client.dart';
import '../../models/login_response.dart';

class RegisterRepository{

  RegisterRepository({required this.dioClient});

  final DioClient dioClient;

  Future<LoginResponse> register(Map<String, dynamic> data){
    try {
      return dioClient.register(data);
    }catch(e){
      throw Exception("Something went wrong!!");
    }
  }
}

final userRepositoryProvider = Provider<RegisterRepository>((ref) {
  return RegisterRepository(dioClient: ref.watch(dioClientProvider));
});