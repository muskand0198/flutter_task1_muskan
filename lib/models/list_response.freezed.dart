// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ListResponse _$ListResponseFromJson(Map<String, dynamic> json) {
  return _ListResponse.fromJson(json);
}

/// @nodoc
mixin _$ListResponse {
  int? get page => throw _privateConstructorUsedError;
  @JsonKey(name: "per_page")
  int? get perPage => throw _privateConstructorUsedError;
  int? get total => throw _privateConstructorUsedError;
  @JsonKey(name: "total_pages")
  int? get totalPages => throw _privateConstructorUsedError;
  List<UserData>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListResponseCopyWith<ListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListResponseCopyWith<$Res> {
  factory $ListResponseCopyWith(
          ListResponse value, $Res Function(ListResponse) then) =
      _$ListResponseCopyWithImpl<$Res, ListResponse>;
  @useResult
  $Res call(
      {int? page,
      @JsonKey(name: "per_page") int? perPage,
      int? total,
      @JsonKey(name: "total_pages") int? totalPages,
      List<UserData>? data});
}

/// @nodoc
class _$ListResponseCopyWithImpl<$Res, $Val extends ListResponse>
    implements $ListResponseCopyWith<$Res> {
  _$ListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? perPage = freezed,
    Object? total = freezed,
    Object? totalPages = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      perPage: freezed == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPages: freezed == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<UserData>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ListResponseCopyWith<$Res>
    implements $ListResponseCopyWith<$Res> {
  factory _$$_ListResponseCopyWith(
          _$_ListResponse value, $Res Function(_$_ListResponse) then) =
      __$$_ListResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? page,
      @JsonKey(name: "per_page") int? perPage,
      int? total,
      @JsonKey(name: "total_pages") int? totalPages,
      List<UserData>? data});
}

/// @nodoc
class __$$_ListResponseCopyWithImpl<$Res>
    extends _$ListResponseCopyWithImpl<$Res, _$_ListResponse>
    implements _$$_ListResponseCopyWith<$Res> {
  __$$_ListResponseCopyWithImpl(
      _$_ListResponse _value, $Res Function(_$_ListResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? perPage = freezed,
    Object? total = freezed,
    Object? totalPages = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_ListResponse(
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      perPage: freezed == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPages: freezed == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<UserData>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ListResponse implements _ListResponse {
  const _$_ListResponse(
      {this.page,
      @JsonKey(name: "per_page") this.perPage,
      this.total,
      @JsonKey(name: "total_pages") this.totalPages,
      required final List<UserData>? data})
      : _data = data;

  factory _$_ListResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ListResponseFromJson(json);

  @override
  final int? page;
  @override
  @JsonKey(name: "per_page")
  final int? perPage;
  @override
  final int? total;
  @override
  @JsonKey(name: "total_pages")
  final int? totalPages;
  final List<UserData>? _data;
  @override
  List<UserData>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ListResponse(page: $page, perPage: $perPage, total: $total, totalPages: $totalPages, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ListResponse &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, page, perPage, total, totalPages,
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ListResponseCopyWith<_$_ListResponse> get copyWith =>
      __$$_ListResponseCopyWithImpl<_$_ListResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ListResponseToJson(
      this,
    );
  }
}

abstract class _ListResponse implements ListResponse {
  const factory _ListResponse(
      {final int? page,
      @JsonKey(name: "per_page") final int? perPage,
      final int? total,
      @JsonKey(name: "total_pages") final int? totalPages,
      required final List<UserData>? data}) = _$_ListResponse;

  factory _ListResponse.fromJson(Map<String, dynamic> json) =
      _$_ListResponse.fromJson;

  @override
  int? get page;
  @override
  @JsonKey(name: "per_page")
  int? get perPage;
  @override
  int? get total;
  @override
  @JsonKey(name: "total_pages")
  int? get totalPages;
  @override
  List<UserData>? get data;
  @override
  @JsonKey(ignore: true)
  _$$_ListResponseCopyWith<_$_ListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
