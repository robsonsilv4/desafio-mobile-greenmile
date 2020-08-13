import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:greenmile_challenge/data/models/resource.dart';
import 'package:meta/meta.dart';

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
          final resources = await resourceRepository.getAllResources();
          yield ResourceSuccess(resources: resources, hasReachedMax: false);
          return;
        }

        if (currentState is ResourceSuccess) {
          final resources = await resourceRepository.getAllResources();
          yield resources.isEmpty
              ? currentState.copyWith(hasReachedMax: true)
              : ResourceSuccess(
                  resources: resources,
                  hasReachedMax: false,
                );
        }
      } catch (_) {
        yield ResourceFailure();
      }
    }
  }
}
