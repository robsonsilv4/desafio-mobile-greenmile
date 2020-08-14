import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/resource/resource_bloc.dart';
import '../widgets/bottom_loader.dart';
import '../widgets/resource_item.dart';

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
      appBar: AppBar(
        title: Text('Desafio Mobile'),
      ),
      body: BlocBuilder(
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
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
