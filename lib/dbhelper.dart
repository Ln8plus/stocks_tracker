import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:typed_data';

class Dbhelper {
  Dbhelper._privateConstructor();
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await initDB();
    return _database;
  }

  static final Dbhelper instance = Dbhelper._privateConstructor();
  Future<Database> initDB() async {
    var dbPath = await getDatabasesPath();
    var path = join(dbPath, "STOCKS.db");

    var exists = await databaseExists(path);
    if (!exists) {
      // Should happen only the first time you launch your application
      print("Creating new copy from asset");

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      ByteData data = await rootBundle.load(join("assets", "STOCKS.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);

      return await openDatabase(path);
    }
    var db = await openDatabase(path, readOnly: true);

    Future<List> queryall(String listings) async {
      var dbClient = await db;
      var result = await dbClient.rawQuery("SELECT * FROM $listings");

      return result.toList();
    }
  }
}
