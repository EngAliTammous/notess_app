
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user.dart';

enum PrefKeys {
  id , firstName , lastName , phone, email , password ,loggedIn
}

//The loggedIn key is set to true, indicating that the user is currently logged in.



class PrefController {
  static final PrefController _instance = PrefController._();


  // singleton pattern
  PrefController._();

  late SharedPreferences _sharedPreferences;

  factory PrefController() {
    return _instance;
  }

  Future<void> initPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  // store user data in pairs (key , value) , that persists even after the app is closed.
  Future<void> save(User user) async {
    await _sharedPreferences.setBool(PrefKeys.loggedIn.toString() , true);
    await _sharedPreferences.setInt(PrefKeys.id.toString(), user.id);
    await _sharedPreferences.setString(PrefKeys.firstName.toString(), user.firstName);
    await _sharedPreferences.setString(PrefKeys.lastName.toString(), user.lastName);
    await _sharedPreferences.setString(PrefKeys.phone.toString(), user.phone);
    await _sharedPreferences.setString(PrefKeys.email.toString(), user.email);
    await _sharedPreferences.setString(PrefKeys.password.toString(), user.password);

  }

  bool get loggedIn => _sharedPreferences.getBool(PrefKeys.loggedIn.toString()) ?? false;

  Future<bool> clear() async => await _sharedPreferences.clear();

  /*
  * الان لو بدي ارجع الاسم والرقم والايميل مش منطقي اعمل لكل وحدة دالة ارجاع !
  * بعمل دالة جينريك وبشتغل عليها

  * */
  T? getKey <T> ({required String key}){
    return _sharedPreferences.get(key) as T? ;
  }


}
