import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/resource.dart';

List<Resource> parseResources(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Resource>((json) => Resource.fromJson(json)).toList();
}

class DataProvider {
  final http.Client client;

  DataProvider({@required this.client});

  Future<List<Resource>> fetchResources() async {
    final response = await client
        .get('http://portal.greenmilesoftware.com/get_resources_since');
    return compute(parseResources, response.body);
  }
}
