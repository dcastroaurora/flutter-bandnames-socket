import 'package:freezed_annotation/freezed_annotation.dart';
part 'band.freezed.dart';
part 'band.g.dart';

@freezed
abstract class Band with _$Band {
  const factory Band({
    String id,
    String name,
    int votes,
  }) = _Band;

  factory Band.fromJson(Map<String, dynamic> json) => _$BandFromJson(json);
}
