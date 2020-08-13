class Resource {
  ResourceAttributes resource;

  Resource({this.resource});

  Resource.fromJson(Map<String, dynamic> json) {
    resource = json['resource'] != null
        ? ResourceAttributes.fromJson(json['resource'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.resource != null) {
      data['resource'] = this.resource.toJson();
    }
    return data;
  }
}

class ResourceAttributes {
  String createdAt;
  String updatedAt;
  String resourceId;
  String moduleId;
  String value;
  String languageId;

  ResourceAttributes(
      {this.createdAt,
      this.updatedAt,
      this.resourceId,
      this.moduleId,
      this.value,
      this.languageId});

  ResourceAttributes.fromJson(Map<String, dynamic> json) {
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    resourceId = json['resource_id'];
    moduleId = json['module_id'];
    value = json['value'];
    languageId = json['language_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['resource_id'] = this.resourceId;
    data['module_id'] = this.moduleId;
    data['value'] = this.value;
    data['language_id'] = this.languageId;
    return data;
  }
}
