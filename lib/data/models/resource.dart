import 'package:json_annotation/json_annotation.dart';

part 'resource.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Resource {
  String createdAt;
  String updatedAt;
  String resourceId;
  String moduleId;
  String value;
  String languageId;

  Resource({
    this.createdAt,
    this.updatedAt,
    this.resourceId,
    this.moduleId,
    this.value,
    this.languageId,
  });

  factory Resource.fromJson(Map<String, dynamic> json) =>
      _$ResourceFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceToJson(this);
}
