part of 'resource_search_bloc.dart';

class ResourceSearchEvent extends Equatable {
  final String query;

  ResourceSearchEvent(this.query);

  @override
  List<Object> get props => [query];

  @override
  String toString() => 'ResourceSearchEvent { query: $query }';
}
