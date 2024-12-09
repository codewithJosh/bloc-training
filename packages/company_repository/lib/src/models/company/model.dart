import 'package:freezed_annotation/freezed_annotation.dart';

part 'model.freezed.dart';
part 'model.g.dart';

@Freezed()
class Company with _$Company {
  const Company._();

  const factory Company({
    String? id,
    required String name,
    required String address,
  }) = _Company;

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);
}
