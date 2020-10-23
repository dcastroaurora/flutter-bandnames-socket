// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'band.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Band _$BandFromJson(Map<String, dynamic> json) {
  return _Band.fromJson(json);
}

/// @nodoc
class _$BandTearOff {
  const _$BandTearOff();

// ignore: unused_element
  _Band call({String id, String name, int votes}) {
    return _Band(
      id: id,
      name: name,
      votes: votes,
    );
  }

// ignore: unused_element
  Band fromJson(Map<String, Object> json) {
    return Band.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Band = _$BandTearOff();

/// @nodoc
mixin _$Band {
  String get id;
  String get name;
  int get votes;

  Map<String, dynamic> toJson();
  $BandCopyWith<Band> get copyWith;
}

/// @nodoc
abstract class $BandCopyWith<$Res> {
  factory $BandCopyWith(Band value, $Res Function(Band) then) =
      _$BandCopyWithImpl<$Res>;
  $Res call({String id, String name, int votes});
}

/// @nodoc
class _$BandCopyWithImpl<$Res> implements $BandCopyWith<$Res> {
  _$BandCopyWithImpl(this._value, this._then);

  final Band _value;
  // ignore: unused_field
  final $Res Function(Band) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object votes = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      votes: votes == freezed ? _value.votes : votes as int,
    ));
  }
}

/// @nodoc
abstract class _$BandCopyWith<$Res> implements $BandCopyWith<$Res> {
  factory _$BandCopyWith(_Band value, $Res Function(_Band) then) =
      __$BandCopyWithImpl<$Res>;
  @override
  $Res call({String id, String name, int votes});
}

/// @nodoc
class __$BandCopyWithImpl<$Res> extends _$BandCopyWithImpl<$Res>
    implements _$BandCopyWith<$Res> {
  __$BandCopyWithImpl(_Band _value, $Res Function(_Band) _then)
      : super(_value, (v) => _then(v as _Band));

  @override
  _Band get _value => super._value as _Band;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object votes = freezed,
  }) {
    return _then(_Band(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      votes: votes == freezed ? _value.votes : votes as int,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Band implements _Band {
  const _$_Band({this.id, this.name, this.votes});

  factory _$_Band.fromJson(Map<String, dynamic> json) =>
      _$_$_BandFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final int votes;

  @override
  String toString() {
    return 'Band(id: $id, name: $name, votes: $votes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Band &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.votes, votes) ||
                const DeepCollectionEquality().equals(other.votes, votes)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(votes);

  @override
  _$BandCopyWith<_Band> get copyWith =>
      __$BandCopyWithImpl<_Band>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BandToJson(this);
  }
}

abstract class _Band implements Band {
  const factory _Band({String id, String name, int votes}) = _$_Band;

  factory _Band.fromJson(Map<String, dynamic> json) = _$_Band.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  int get votes;
  @override
  _$BandCopyWith<_Band> get copyWith;
}
