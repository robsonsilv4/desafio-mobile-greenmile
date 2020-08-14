import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../blocs/resource/resource_bloc.dart';
import '../../data/models/resource.dart';
import '../widgets/bottom_loader.dart';
import '../widgets/resource_item.dart';
import '../widgets/resource_search.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ResourceBloc _resourceBloc;

  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;

    if (maxScroll - currentScroll <= _scrollThreshold) {
      _resourceBloc.add(ResourceFetched());
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _resourceBloc = BlocProvider.of<ResourceBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 20.0,
                bottom: 8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    'assets/black_logo.svg',
                    fit: BoxFit.cover,
                    color: Colors.green,
                    placeholderBuilder: (context) => Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.search,
                      size: 30.0,
                      color: Colors.grey,
                    ),
                    onPressed: () async {
                      Resource selected = await showSearch<Resource>(
                        context: context,
                        delegate: ResourceSearch(),
                      );
                      print(selected);
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder(
                  cubit: _resourceBloc,
                  builder: (context, state) {
                    if (state is ResourceInitial) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (state is ResourceFailure) {
                      return Center(
                        child: Text('Ocorreu um erro ao carregar os recursos.'),
                      );
                    }

                    if (state is ResourceSuccess) {
                      if (state.resources.isEmpty) {
                        return Center(
                          child: Text('Nenhum recurso encontrado.'),
                        );
                      }
                    }

                    return ListView.builder(
                      itemCount: state.hasReachedMax
                          ? state.resources.length
                          : state.resources.length + 1,
                      controller: _scrollController,
                      itemBuilder: (context, index) {
                        return index >= state.resources.length
                            ? BottomLoader()
                            : ResourceItem(
                                resource: state.resources[index],
                              );
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
