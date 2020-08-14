import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/models/resource.dart';
import '../../data/repositories/resource_repository.dart';

part 'resource_event.dart';
part 'resource_state.dart';

class ResourceBloc extends Bloc<ResourceEvent, ResourceState> {
  final ResourceRepository resourceRepository;

  ResourceBloc({@required this.resourceRepository})
      : assert(resourceRepository != null),
        super(ResourceInitial());

  bool _hasReachedMax(ResourceState state) =>
      state is ResourceSuccess && state.hasReachedMax;

  @override
  Stream<ResourceState> mapEventToState(
    ResourceEvent event,
  ) async* {
    final currentState = state;
    if (event is ResourceFetched && !_hasReachedMax(currentState)) {
      try {
        if (currentState is ResourceInitial) {
          final existsLocally = await resourceRepository.existsLocally();
          if (!existsLocally) {
            await resourceRepository.fetchResources();
          }
          final resources = await resourceRepository.getResources(
            startIndex: 0,
            limit: 20,
          );
          yield ResourceSuccess(
            resources: resources,
            hasReachedMax: false,
          );
          return;
        }

        if (currentState is ResourceSuccess) {
          final resources = await resourceRepository.getResources(
            startIndex: currentState.resources.length,
            limit: 20,
          );
          yield resources.isEmpty
              ? currentState.copyWith(hasReachedMax: true)
              : ResourceSuccess(
                  resources: currentState.resources + resources,
                  hasReachedMax: false,
                );
        }
      } catch (error, stacktace) {
        print(error);
        print(stacktace);
        yield ResourceFailure();
      }
    }
  }
}
