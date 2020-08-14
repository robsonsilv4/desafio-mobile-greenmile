import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../constants.dart';
import '../models/resource.dart';

List<Resource> _parseResources(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Resource>((json) {
    final resource = json['resource'] != null ? json['resource'] : null;
    return Resource.fromJson(resource);
  }).toList();
}

class RemoteProvider {
  final http.Client client;

  RemoteProvider({@required this.client});

  Future<List<Resource>> fetchResources() async {
    final response = await client.get(baseUrl);
    return compute(_parseResources, utf8.decode(response.bodyBytes));
  }
}