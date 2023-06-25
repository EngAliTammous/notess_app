

import 'package:note_app/controller/database/database_opertions.dart';
import 'package:sqflite/sqflite.dart';

import '../model/user.dart';
import '../storge/prefs_controller.dart';
import 'database/database_controller.dart';

class UserDbController implements DataBaseOperations<User>{


  // instance
  Database database = DataBaseController().database;


  /*
* This code defines an asynchronous method login that attempts
*  to log in a user with the given email and password.
*  The method returns a Future<bool> indicating whether the login was successful or not.

The method uses an instance of a dbController class to query a SQLite database table named "users"
*  using the query() method. The query specifies a filter on the email and password columns using
*  a where clause that includes placeholders for the email and password values.
* The actual email and password values are passed as arguments to the query() method
*  through the whereArgs parameter. The query() method returns a list of maps,
*  where each map corresponds to a row in the "users" table that matches the filter criteria.

If the maps list is not empty, it means that a user with the specified email and password was found
* in the "users" table. The code then creates a User object using the fromMap()
* method of the User class and the first map in the maps list.
*  The fromMap() method is used to convert the map into a User object.

Finally, the code saves the User object to shared preferences using the save()
*  method of the PrefController class. This method stores the user's ID, name, email, and a flag
*  indicating that the user is currently logged in.

The method returns true if the maps list is not empty,
*  indicating that a user was found in the database, and false otherwise, indicating
*  that the login failed.
*
* */
  Future<bool> login({required String email, required String password}) async {
    List<Map<String, dynamic>> maps = await database.query('users',
        where: 'email = ? AND password = ? ', whereArgs: [email, password]);

    if (maps.isNotEmpty) {
      User user = User.fromMap(maps.first);
      await PrefController().save(user);
    }

    return maps.isNotEmpty;
  }




  @override
  Future<int> create(User model) async{

    int newRowId = await database.insert('users', model.toMap());

    return newRowId ;

  }

  @override
  Future<bool> delete(int id) async {
    // ? => whereArgs: [id]
    int countOfDeleteRows = await database.delete('users',where: 'id = ?',whereArgs: [id]);
    return countOfDeleteRows == 1 ;

  }

  @override
  Future<List<User>> read(_) async{

    List<Map<String,dynamic>> rows = await database.query('users',);
    // limit:3 => first 3 rows , offset:3 => exception of 3 first rows
    // column => select appear column
    return rows.map((Map<String,dynamic> map) => User.fromMap(map)).toList();



  }


  Future<User?> show(int id) async{

    List<Map<String,dynamic>> rows = await database.query('users',where: 'id = ?',whereArgs: [id]);
    if(rows.isNotEmpty){
      return User.fromMap(rows.first);
    }
    return null;
    // By default null

  }

  @override
  Future<bool> update(User model) async{
    int countOfUpdatesRows = await database.update('users', model.toMap() , where: 'id = ? ',whereArgs: [model.id]);
    return countOfUpdatesRows == 1;
    // == 1 => اما هيتعدل صف او ولا صف
  }




}


