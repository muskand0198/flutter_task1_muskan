import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final sharedUtilityProvider = Provider.autoDispose<SharedUtility>((ref) {
  final sharedPrefs = ref.watch(sharedPreferencesProvider);
  final sharedUtility = SharedUtility(sharedPreferences: sharedPrefs);
  ref.onDispose(() => sharedUtility);
  return sharedUtility;
});

class SharedUtility {
  SharedUtility({
    required this.sharedPreferences,
  });

  final SharedPreferences sharedPreferences;

  String getToken(){
    return sharedPreferences.getString("token") ?? "";
  }

  void setToken({required String token}) {
    sharedPreferences.setString("token", token);
  }

  Future<bool> logout() async {
    return await sharedPreferences.clear().then((value) => true);
  }
}
