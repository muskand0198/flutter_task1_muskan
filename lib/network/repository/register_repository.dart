import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task1_muskan/network/apis/dio_client.dart';
import '../../models/login_response.dart';

class RegisterRepository{

  RegisterRepository({required this.dioClient});

  final DioClient dioClient;

  Future<LoginResponse> register(Map<String, dynamic> data) async{
    try {
      final response = await dioClient.register(data);
      if (response.statusCode == 200) {
        final body = response.data;
        return LoginResponse.fromJson(body);
      } else {
        throw Exception("Something went wrong!!");
      }
    }catch(e){
      throw Exception("Something went wrong!!");
    }
  }
}

final userRepositoryProvider = Provider.autoDispose<RegisterRepository>((ref) {
  final registerRepo = RegisterRepository(dioClient: ref.watch(dioClientProvider));
  ref.onDispose(() => registerRepo);
  return registerRepo;
});