import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/resource_search/resource_search_bloc.dart';
import '../../data/models/resource.dart';
import '../../data/services/services_locator.dart';

class ResourceSearch extends SearchDelegate<Resource> {
  final resourceSearch = getIt.get<ResourceSearchBloc>();

  @override
  List<Widget> buildActions(BuildContext context) => null;

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: BackButton(),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    resourceSearch.add(ResourceSearchEvent(query));

    return BlocBuilder(
      cubit: resourceSearch,
      builder: (context, ResourceSearchState state) {
        if (state.isLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state.hasError) {
          return Container(
            margin: const EdgeInsets.all(16.0),
            child: Text('Ocorreu um erro ao realizar a pesquisa.'),
          );
        }
        return ListView.builder(
          itemCount: state.resources.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Icon(Icons.local_library),
              title: Text(state.resources[index].value),
              onTap: () => close(
                context,
                state.resources[index],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) => Container();

  @override
  String get searchFieldLabel => 'Procurar recursos...';
}
