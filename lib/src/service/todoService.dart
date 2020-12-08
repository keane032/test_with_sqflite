import 'package:myvocation/src/model/questModel.dart';
import 'package:myvocation/src/service/dbService.dart';
import 'package:sqflite/sqflite.dart';

class TodoService {

  int index;
  static Database _dataBase;
  Database get instance => _dataBase;

  openConection() async {
      _dataBase = await getConection();
      return instance;
  }


  insertTodo(Quest todo) async {
    Database data = _dataBase;
    await data.insert(
      'todo',
      todo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Quest>> getTodos() async {
    Database data = _dataBase;
    final List<Map<String, dynamic>> maps = await data.query('todo');
    return List.generate(maps.length, (i) {
      return Quest(
          id: maps[i]['id'],
          name: maps[i]['name'],
          descripition: maps[i]['descripition'],
          status: maps[i]['status'],
      );
    }
    );
  }
}