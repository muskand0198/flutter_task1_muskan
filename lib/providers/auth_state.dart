import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task1_muskan/models/response.dart';
import 'package:flutter_task1_muskan/network/repository/register_repository.dart';

class AuthState extends StateNotifier<MyResponse> {
  Ref ref;

  AuthState({required this.ref}) : super(const MyResponse.initial());

  Future<MyResponse> register(Map<String, dynamic> data) async {
    state = const MyResponse.loading();
    try {
      var result = await ref.read(userRepositoryProvider).register(data);

      state = MyResponse.success(result);
      return MyResponse.success(result);
    } catch (e) {
      state = MyResponse.error("$e");
      return MyResponse.error("$e");
    }
  }
}

final authStateProvider = StateNotifierProvider<AuthState, MyResponse>((ref) {
  return AuthState(ref: ref);
});


