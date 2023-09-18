// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ListResponse _$$_ListResponseFromJson(Map<String, dynamic> json) =>
    _$_ListResponse(
      page: json['page'] as int?,
      perPage: json['per_page'] as int?,
      total: json['total'] as int?,
      totalPages: json['total_pages'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => UserData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ListResponseToJson(_$_ListResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'per_page': instance.perPage,
      'total': instance.total,
      'total_pages': instance.totalPages,
      'data': instance.data,
    };
