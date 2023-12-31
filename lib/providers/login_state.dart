import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task1_muskan/models/response.dart';
import 'package:flutter_task1_muskan/network/repository/login_repository.dart';

class LoginState extends StateNotifier<MyResponse> {
  Ref ref;

  LoginState({required this.ref}) : super(const MyResponse.initial());

  Future<MyResponse> login(Map<String, dynamic> data) async {
    state = const MyResponse.loading();
    try {
      var result = await ref.read(loginRepositoryProvider).login(data);

      state = MyResponse.success(result);
      return MyResponse.success(result);
    } catch (e) {
      state = MyResponse.error("$e");
      return MyResponse.error("$e");
    }
  }
}

final loginStateProvider = StateNotifierProvider<LoginState, MyResponse>((ref) {
  return LoginState(ref: ref);
});
