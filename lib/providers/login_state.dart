import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task1_muskan/models/login_response.dart';
import 'package:flutter_task1_muskan/network/repository/login_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_state.g.dart';

@riverpod
class LoginState extends _$LoginState {
  // Ref ref;
  //
  // LoginState({required this.ref}) : super(const MyResponse.initial());

  @override
  FutureOr<LoginResponse?> build(){
    return null;
  }

  Future<LoginResponse?> login(Map<String, dynamic> data) async {
    state = const AsyncValue.loading();
    try {
      var result = await ref.read(loginRepositoryProvider).login(data);

      state = AsyncValue.data(result);
      return result;
    } catch (e, s) {
      state = AsyncValue.error("$e", s);
      return null;
    }
  }
}

// final loginStateProvider = StateNotifierProvider<LoginState, MyResponse>((ref) {
//   return LoginState(ref: ref);
// });
