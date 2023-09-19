import 'package:flutter_task1_muskan/models/user_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_response.freezed.dart';
part 'list_response.g.dart';

@freezed
class ListResponse with _$ListResponse{
  const factory ListResponse({
    int? page,
    @JsonKey(name: "per_page") int? perPage,
    int? total,
    @JsonKey(name: "total_pages")int? totalPages,
    required List<UserData>? data
  }) = _ListResponse;

  factory ListResponse.fromJson(Map<String, dynamic> json) => _$ListResponseFromJson(json);

}