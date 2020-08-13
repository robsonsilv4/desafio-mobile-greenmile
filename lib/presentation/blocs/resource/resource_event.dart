part of 'resource_bloc.dart';

abstract class ResourceEvent extends Equatable {
  const ResourceEvent();

  @override
  List<Object> get props => [];
}

class ResourceFetched extends ResourceEvent {}
