import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '../../blocs/resource_search/resource_search_bloc.dart';
import '../data_providers/local_provider.dart';
import '../data_providers/remote_provider.dart';
import '../repositories/resource_repository.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton(() => http.Client());
  getIt.registerLazySingleton(() => LocalProvider());
  getIt.registerLazySingleton(() => RemoteProvider());
  getIt.registerLazySingleton(() => ResourceRepository());
  getIt.registerLazySingleton(() => ResourceSearchBloc());
}
