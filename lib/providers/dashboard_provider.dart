import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task1_muskan/models/response.dart';
import 'package:flutter_task1_muskan/network/repository/dashboard_repo.dart';

class DashboardState extends StateNotifier<MyResponse> {
  Ref ref;

  DashboardState({required this.ref}) : super(const MyResponse.initial()){
    getUsersList();
  }

  Future<MyResponse> getUsersList() async {
    state = const MyResponse.loading();
    try {
      var result = await ref.read(dashboardRepositoryProvider).getUsersList();

      state = MyResponse.success(result);
      return MyResponse.success(result);
    } catch (e) {
      state = MyResponse.error("$e");
      return MyResponse.error("$e");
    }
  }
}

final dashboardProvider = StateNotifierProvider<DashboardState, MyResponse>((ref) {
  return DashboardState(ref: ref);
});

