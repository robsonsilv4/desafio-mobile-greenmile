part of 'resource_bloc.dart';

abstract class ResourceState extends Equatable {
  const ResourceState();

  @override
  List<Object> get props => [];
}

class ResourceInitial extends ResourceState {}

class ResourceFailure extends ResourceState {}

class ResourceSuccess extends ResourceState {
  final List<Resource> resources;
  final bool hasReachedMax;

  ResourceSuccess({this.resources, this.hasReachedMax});

  ResourceSuccess copyWith({
    List<Resource> resources,
    bool hasReachedMax,
  }) {
    return ResourceSuccess(
      resources: resources ?? this.resources,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [resources, hasReachedMax];
}
