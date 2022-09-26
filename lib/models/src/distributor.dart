import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'distributor.freezed.dart';
part 'distributor.g.dart';

class Distributor with _$Distributor {
  const factory Distributor({
    required String id,
    required String email,
    required int phoneNumber,
  }) = _Distributor;

  factory Distributor.fromJson(Map<String, Object?> json) =>
      _$DistributorFromJson(json);
}
