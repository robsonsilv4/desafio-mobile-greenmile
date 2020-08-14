part of 'resource_search_bloc.dart';

class ResourceSearchState extends Equatable {
  final bool isLoading;
  final List<Resource> resources;
  final bool hasError;

  ResourceSearchState({
    this.isLoading,
    this.resources,
    this.hasError,
  });

  factory ResourceSearchState.initial() {
    return ResourceSearchState(
      resources: [],
      isLoading: false,
      hasError: false,
    );
  }

  factory ResourceSearchState.loading() {
    return ResourceSearchState(
      resources: [],
      isLoading: true,
      hasError: false,
    );
  }

  factory ResourceSearchState.success(List<Resource> resources) {
    return ResourceSearchState(
      resources: resources,
      isLoading: false,
      hasError: false,
    );
  }

  factory ResourceSearchState.error() {
    return ResourceSearchState(
      resources: [],
      isLoading: false,
      hasError: true,
    );
  }

  @override
  List<Object> get props => [
        isLoading,
        resources,
        hasError,
      ];

  @override
  String toString() =>
      'ResourceSearchState { resources: ${resources.toString()}, isLoading: $isLoading, hasError: $hasError }';
}
