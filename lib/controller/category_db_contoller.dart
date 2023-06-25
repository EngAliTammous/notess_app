
import 'package:note_app/controller/database/database_opertions.dart';
import 'package:sqflite/sqflite.dart';

import '../model/category.dart';
import '../storge/prefs_controller.dart';
import 'database/database_controller.dart';

class CategoryDbController implements DataBaseOperations<MyCategory> {

  Database database = DataBaseController().database;


  @override
  Future<int> create(MyCategory model) async {
    int newRow = await database.insert('categories', model.toMap());
    return newRow ;
  }

  @override
  Future<bool> delete(int id) async{
    int countOfDeleteRows = await database.delete('categories',where: 'id = ?',whereArgs: [id]);
    return countOfDeleteRows == 1 ;
  }

  @override
  Future<List<MyCategory>> read(_) async {
    // return all notes based on user_id and categoryId
    List<Map<String,dynamic>> rows = await database.query('categories',
        where: 'userId = ? ',whereArgs: [
          PrefController().getKey<int>(key: PrefKeys.id.toString()),

        ]);

    return rows.map((Map<String,dynamic> map) => MyCategory.fromMap(map)).toList();

  }

  @override
  Future<bool> update(MyCategory model) async{
    int countOfUpdateRows = await database.update('categories', model.toMap() ,where: 'id = ?',whereArgs: [model.id]);
    return countOfUpdateRows == 1 ;
  }

}