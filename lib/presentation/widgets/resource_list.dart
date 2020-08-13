import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../data/models/resource.dart';

class ResourceList extends StatelessWidget {
  final List<Resource> resources;

  const ResourceList({Key key, this.resources}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatter = DateFormat('dd-MM-yyyy hh:mm:ss');

    return ListView.builder(
      itemCount: resources.length,
      itemBuilder: (context, index) {
        final resource = resources[index].resource;

        final updatedAt = DateTime.parse(resource.updatedAt);
        final formattedUpdatedAt = formatter.format(updatedAt);

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                resource.resourceId,
                overflow: TextOverflow.ellipsis,
              ),
              Text(formattedUpdatedAt),
              Text(
                resource.value,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      },
    );
  }
}
