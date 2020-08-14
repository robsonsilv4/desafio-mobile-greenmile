import 'package:json_annotation/json_annotation.dart';

part 'resource.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Resource {
  String updatedAt;
  String resourceId;
  String value;

  Resource({
    this.updatedAt,
    this.resourceId,
    this.value,
  });

  factory Resource.fromJson(Map<String, dynamic> json) =>
      _$ResourceFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceToJson(this);
}
