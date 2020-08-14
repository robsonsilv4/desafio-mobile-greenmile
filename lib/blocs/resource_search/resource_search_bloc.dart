import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/resource.dart';
import '../../data/repositories/resource_repository.dart';
import '../../data/services/services_locator.dart';

part 'resource_search_event.dart';
part 'resource_search_state.dart';

class ResourceSearchBloc
    extends Bloc<ResourceSearchEvent, ResourceSearchState> {
  final resourceRepository = getIt.get<ResourceRepository>();

  ResourceSearchBloc() : super(ResourceSearchState.initial());

  @override
  void onTransition(
    Transition<ResourceSearchEvent, ResourceSearchState> transition,
  ) {
    super.onTransition(transition);
    print(transition.toString());
  }

  @override
  Stream<ResourceSearchState> mapEventToState(
    ResourceSearchEvent event,
  ) async* {
    yield ResourceSearchState.loading();

    try {
      List<Resource> resources = await resourceRepository.searchResources(
        query: event.query,
      );
      yield ResourceSearchState.success(resources);
    } catch (error, stacktrace) {
      print(error);
      print(stacktrace);
      yield ResourceSearchState.error();
    }
  }
}
