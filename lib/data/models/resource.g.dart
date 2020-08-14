// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Resource _$ResourceFromJson(Map<String, dynamic> json) {
  return Resource(
    updatedAt: json['updated_at'] as String,
    resourceId: json['resource_id'] as String,
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$ResourceToJson(Resource instance) => <String, dynamic>{
      'updated_at': instance.updatedAt,
      'resource_id': instance.resourceId,
      'value': instance.value,
    };
