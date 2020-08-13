import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../data/models/resource.dart';

class ResourceItem extends StatelessWidget {
  final ResourceAttributes resource;

  const ResourceItem({Key key, this.resource}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatter = DateFormat('dd-MM-yyyy hh:mm:ss');
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
  }
}
