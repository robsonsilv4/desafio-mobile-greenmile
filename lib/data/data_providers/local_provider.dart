import 'package:meta/meta.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../constants.dart';
import '../models/resource.dart';

class LocalProvider {
  Future<Database> _initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), databaseName),
      onCreate: (database, version) {
        return database.execute(
          """CREATE TABLE $tableName(updated_at TEXT,
                                    resource_id TEXT,
                                    value TEXT)""",
        );
      },
      version: 1,
    );
  }

  Future<bool> existsLocally() async {
    final exists = await databaseExists(
      join(await getDatabasesPath(), databaseName),
    );
    if (exists) {
      final database = await _initDatabase();
      final count = await database.rawQuery(
        'SELECT COUNT(*) as total FROM $tableName',
      );
      return count.first["total"] > 0;
    }
    return false;
  }

  Future<void> insertResources({@required List<Resource> resources}) async {
    final database = await _initDatabase();
    database.transaction((transaction) async {
      for (int index = 0; index < 1000; index++) {
        await transaction.insert(tableName, resources[index].toJson());
      }
    });
  }

  Future<List<Resource>> getResources({int startIndex, int limit}) async {
    final database = await _initDatabase();
    final resources = await database.rawQuery(
      'SELECT * FROM $tableName LIMIT $limit OFFSET $startIndex',
    );
    return resources.map((resource) => Resource.fromJson(resource)).toList();
  }

  Future<List<Resource>> searchResources({String value}) async {
    final database = await _initDatabase();
    final resources = await database.rawQuery(
      'SELECT * FROM $tableName WHERE value LIKE "%$value%"',
    );
    return resources.map((resource) => Resource.fromJson(resource)).toList();
  }
}
