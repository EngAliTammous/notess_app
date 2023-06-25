

import '../storge/prefs_controller.dart';

class GetFromPrefController {
  String charFirst =
  PrefController().getKey(key: PrefKeys.firstName.toString());

  String firstName = PrefController().getKey(key: PrefKeys.firstName.toString() );
  String lastName = PrefController().getKey(key: PrefKeys.lastName.toString() );

  String email = PrefController().getKey(key: PrefKeys.email.toString());

}
