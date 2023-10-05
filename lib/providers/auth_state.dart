import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_task1_muskan/models/login_response.dart';
import 'package:flutter_task1_muskan/network/repository/register_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_state.g.dart';

@riverpod
class AuthState extends _$AuthState {

  @override
  FutureOr<LoginResponse?> build(){
    return null;
  }

  Future<LoginResponse?> register(Map<String, dynamic> data) async {
    state = const AsyncValue.loading();
    try {
      var result = await ref.read(userRepositoryProvider).register(data);

      state = AsyncValue.data(result);
      return result;
    } catch (e, stackTrace) {
      state = AsyncValue.error("$e", stackTrace);
      return null;
    }
  }
}

