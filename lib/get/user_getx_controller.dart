
import 'package:get/get.dart';
import '../controller/user_db_controller.dart';
import '../model/user.dart';

class UserGetController extends GetxController {
  List<User> users = <User>[];

  static  UserDbController get to => Get.find();


  final UserDbController dbUserController = UserDbController();


  Future<bool> login({required String email , required String password}) async{

    return await dbUserController.login(email: email, password: password);


  }



  Future<bool> create({required User user}) async {
    int newRowId = await dbUserController.create(user);

    return newRowId != 0;

  }

  Future<bool> delete(int id) async {
    bool deleted = await dbUserController.delete(id);
    if (deleted) {
      // عشان يعمل تحديث للشاشة
      int index = users.indexWhere((element) => element.id == id);
      //notes.removeWhere((element) => element.id == id);
      //notifyListeners();
      if (index != -1) {
        users.removeAt(index);
        //notifyListeners();
        update();
      }
    }
    return deleted;
  }

  Future<bool> updateUser({required User userUpdated}) async {
    // هيستقبل النسخة المعدلة
    bool updated = await dbUserController.update(userUpdated);
    if (updated) {
      int index = users.indexWhere((element) => element.id == userUpdated.id);
      if (index != -1) {
        users[index] = userUpdated;
        //notifyListeners();
        update();
      }
    }

    return updated;
  }

  Future<User?> shows(int id) async {
    return await dbUserController.show(id);
  }



}