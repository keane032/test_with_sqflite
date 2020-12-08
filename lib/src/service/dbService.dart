import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

getConection() async {

  WidgetsFlutterBinding.ensureInitialized();

  Database database = await openDatabase(

    join(await getDatabasesPath(), 'todo.db'),

    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE todo(id INTEGER PRIMARY KEY, name TEXT, descripition TEXT, status INTEGER)",
      );
    },
    version: 1,
  );

  return database;

}