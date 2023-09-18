import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task1_muskan/models/response.dart';
import 'package:flutter_task1_muskan/network/repository/dashboard_repo.dart';
import 'package:flutter_task1_muskan/network/repository/login_repository.dart';
import 'package:flutter_task1_muskan/network/repository/register_repository.dart';
import 'package:flutter_task1_muskan/providers/shared_preference_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardState extends StateNotifier<MyResponse> {
  Ref ref;

  DashboardState({required this.ref}) : super(MyResponse.initial()){
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

// final sharedPrefs =
// FutureProvider<SharedPreferences>((_) async => await SharedPreferences.getInstance());

