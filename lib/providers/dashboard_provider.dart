import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task1_muskan/models/user_data.dart';
import 'package:flutter_task1_muskan/network/repository/dashboard_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dashboard_provider.g.dart';

@riverpod
class DashboardState extends _$DashboardState {

  @override
  FutureOr<List<UserData>?> build() {
    getUsersList();
    return null;
  }

  // Ref ref;
  //
  // DashboardState({required this.ref}) : super(const MyResponse.initial()){
  //   getUsersList();

  Future<List<UserData>?> getUsersList() async {
    state = const AsyncValue.loading();
    try {
      var result = await ref.read(dashboardRepositoryProvider).getUsersList();

      state = AsyncValue.data(result);
      return result;
    } catch (e, s) {
      state = AsyncValue.error("$e", s);
      return null;
    }
  }
}

// final dashboardProvider = StateNotifierProvider<DashboardState, MyResponse>((ref) {
//   return DashboardState(ref: ref);
// });

