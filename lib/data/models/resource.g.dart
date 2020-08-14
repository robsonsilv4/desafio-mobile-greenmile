// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Resource _$ResourceFromJson(Map<String, dynamic> json) {
  return Resource(
    createdAt: json['created_at'] as String,
    updatedAt: json['updated_at'] as String,
    resourceId: json['resource_id'] as String,
    moduleId: json['module_id'] as String,
    value: json['value'] as String,
    languageId: json['language_id'] as String,
  );
}

Map<String, dynamic> _$ResourceToJson(Resource instance) => <String, dynamic>{
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'resource_id': instance.resourceId,
      'module_id': instance.moduleId,
      'value': instance.value,
      'language_id': instance.languageId,
    };
