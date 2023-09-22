import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task1_muskan/models/user_data.dart';
import 'package:flutter_task1_muskan/network/apis/dio_client.dart';

class DashboardRepository{

  DashboardRepository({required this.dioClient});

  final DioClient dioClient;
  Future<List<UserData>?> getUsersList(){
    try {
      return dioClient.getUsersList();
    }catch(e){
      throw Exception("Something went wrong!!");
    }
  }
}

final dashboardRepositoryProvider = Provider<DashboardRepository>((ref) {
  return DashboardRepository(dioClient: ref.watch(dioClientProvider));
});