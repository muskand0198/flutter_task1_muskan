import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_data.freezed.dart';

part 'user_data.g.dart';

@freezed
class UserData with _$UserData {
  const factory UserData({
    int? id,
    String? email,
    String? first_name,
    String? last_name,
    String? avatar
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
