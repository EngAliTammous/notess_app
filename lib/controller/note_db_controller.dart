import 'package:note_app/controller/database/database_opertions.dart';
import 'package:sqflite/sqflite.dart';
import '../model/note.dart';
import '../storge/prefs_controller.dart';
import 'database/database_controller.dart';


class NoteDbController implements DataBaseOperations<Note> {


  //static NoteGetController get to => Get.find();

  Database database = DataBaseController().database;


  @override
  Future<int> create(Note model) async {
    int newRow = await database.insert('notes', model.toMap());
    return newRow ;
  }

  @override
  Future<bool> delete(int id) async {

    int countOfDeleteRows = await database.delete('notes',where: 'id = ?',whereArgs: [id]);
    return countOfDeleteRows == 1 ;

  }

  @override
  Future<List<Note>> read(int categoryId) async {
    // return all notes based on user_id and categoryId
    List<Map<String,dynamic>> rows = await database.query('notes',
        where: 'userId = ? AND categoryId = ?',whereArgs: [
          PrefController().getKey<int>(key: PrefKeys.id.toString()),
          categoryId ,
        ]);

    return rows.map((Map<String,dynamic> map) => Note.fromMap(map)).toList();


  }

  @override
  Future<bool> update(Note model) async{

    int countOfUpdateRows = await database.update('notes', model.toMap() ,where: 'id = ?',whereArgs: [model.id]);
    return countOfUpdateRows == 1 ;

  }

// CRUD => Create , Read , Update , Delete






}