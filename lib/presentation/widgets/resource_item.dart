import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../data/models/resource.dart';

class ResourceItem extends StatelessWidget {
  final Resource resource;

  const ResourceItem({Key key, this.resource}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedUpdatedAt = '';
    final formatter = DateFormat('dd-MM-yyyy hh:mm:ss');
    if (resource.updatedAt != null) {
      final updatedAt = DateTime.parse(resource.updatedAt);
      formattedUpdatedAt = formatter.format(updatedAt);
    }

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
  }
}
