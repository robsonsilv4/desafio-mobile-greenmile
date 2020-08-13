import 'package:flutter/material.dart';

import '../../data/repositories/resource_repository.dart';
import '../widgets/resource_list.dart';

class HomeScreen extends StatelessWidget {
  final ResourceRepository resourceRepository;

  const HomeScreen({Key key, this.resourceRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Desafio Mobile'),
      ),
      body: FutureBuilder(
        future: resourceRepository.getAllResources(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          }

          return snapshot.hasData
              ? ResourceList(resources: snapshot.data)
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
