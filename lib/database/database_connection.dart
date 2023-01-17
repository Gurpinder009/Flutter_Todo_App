import 'dart:developer';

import "package:sqflite/sqflite.dart";
import "package:path/path.dart" as path;

class DatabaseClass {
  static Database? instance;
  static Future<Database> getInstance() async {
    var databasePath = await getDatabasesPath();
    databasePath = path.join(databasePath, "my_db1");
    instance ??= await openDatabase(databasePath, version: 1,
        onCreate: ((db, version) async {
      await db.execute(
          "create table todo(id integer primary key autoincrement,heading text not null,description text);");

      await db.rawInsert(
          "insert into todo(heading,description)values('Gurpinder singh','description')");
      await db.rawInsert(
          "insert into todo(heading,description)values('Gurpinder1 singh','description1')");
      await db.rawInsert(
          "insert into todo(heading,description)values('Gurpinder1 singh','description1')");
    }));

    if (instance != null) {
      log("database connection is opened");
    } else {
      log("database connection is not opened");
    }

    return Future<Database>.value(instance);
  }
}
