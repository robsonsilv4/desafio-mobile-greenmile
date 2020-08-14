import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../data/models/resource.dart';

class ResourceItem extends StatelessWidget {
  final Resource resource;

  const ResourceItem({Key key, this.resource}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedUpdatedAt = '';
    final formatter = DateFormat('dd-MM-yyyy');
    if (resource.updatedAt != null) {
      final updatedAt = DateTime.parse(resource.updatedAt);
      formattedUpdatedAt = formatter.format(updatedAt);
    }

    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 8.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.local_library,
                  size: 16.0,
                  color: Colors.green,
                ),
                SizedBox(width: 4.0),
                Expanded(
                  child: Text(
                    resource.resourceId,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 4.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.date_range,
                  size: 14.0,
                ),
                SizedBox(width: 4.0),
                Text(
                  formattedUpdatedAt,
                  style: TextStyle(fontSize: 12.0),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Text(
              resource.value,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
