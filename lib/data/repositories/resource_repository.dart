import 'package:flutter/widgets.dart';

import '../data_providers/data_provider.dart';
import '../models/resource.dart';

class ResourceRepository {
  final DataProvider dataProvider;

  ResourceRepository({@required this.dataProvider});

  Future<List<Resource>> getAllResources() async {
    return dataProvider.fetchResources();
  }
}
