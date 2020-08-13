import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'data/data_providers/data_provider.dart';
import 'data/repositories/resource_repository.dart';
import 'presentation/screens/home_screen.dart';

void main() {
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
      home: HomeScreen(
        resourceRepository: ResourceRepository(
          dataProvider: DataProvider(client: http.Client()),
        ),
      ),
    );
  }
}
