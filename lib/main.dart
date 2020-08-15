import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/resource/resource_bloc.dart';
import 'blocs/resource_observer.dart';
import 'data/repositories/resource_repository.dart';
import 'data/services/services_locator.dart';
import 'presentation/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  Bloc.observer = ResourceObserver();
  runApp(App());
}

class App extends StatelessWidget {
  final resourceRepository = getIt.get<ResourceRepository>();

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
        create: (context) => ResourceBloc()..add(ResourceFetched()),
        child: HomeScreen(),
      ),
    );
  }
}
