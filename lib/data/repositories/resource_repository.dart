import 'package:flutter/widgets.dart';

import '../data_providers/local_provider.dart';
import '../data_providers/remote_provider.dart';
import '../models/resource.dart';

class ResourceRepository {
  final LocalProvider localProvider;
  final RemoteProvider remoteProvider;

  ResourceRepository({
    @required this.localProvider,
    @required this.remoteProvider,
  });

  Future<bool> existsLocally() async {
    return await localProvider.existsLocally();
  }

  Future<void> fetchResources() async {
    final resources = await remoteProvider.fetchResources();
    await localProvider.insertResources(resources: resources);
  }

  Future<List<Resource>> getResources({int startIndex, int limit}) async {
    return await localProvider.getResources(
      startIndex: startIndex,
      limit: limit,
    );
  }
}
