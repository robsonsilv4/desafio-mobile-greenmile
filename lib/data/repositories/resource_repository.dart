import '../data_providers/local_provider.dart';
import '../data_providers/remote_provider.dart';
import '../models/resource.dart';
import '../services/services_locator.dart';

class ResourceRepository {
  final localProvider = getIt.get<LocalProvider>();
  final remoteProvider = getIt.get<RemoteProvider>();

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

  Future<List<Resource>> searchResources({String query}) async {
    return await localProvider.searchResources(value: query);
  }
}
