import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'blocs/resource/resource_bloc.dart';
import 'blocs/resource_observer.dart';
import 'data/data_providers/data_provider.dart';
import 'data/repositories/resource_repository.dart';
import 'presentation/screens/home_screen.dart';

void main() {
  Bloc.observer = ResourceObserver();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GreenMile Challenge',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider<ResourceBloc>(
        create: (context) => ResourceBloc(
          resourceRepository: ResourceRepository(
              dataProvider: DataProvider(
            client: http.Client(),
          )),
        )..add(ResourceFetched()),
        child: HomeScreen(),
      ),
    );
  }
}
