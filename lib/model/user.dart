class User {

  late int id ;

  late String firstName;

  late String lastName;

  late String email;

  late String phone;

  late String password;

  User();

  // To read from DB
  User.fromMap(Map<String, dynamic> rowMap){
    id = rowMap['id'];
    firstName = rowMap['firstName'];
    lastName = rowMap['lastName'];
    email = rowMap['email'];
    phone = rowMap['phone'];
    password = rowMap['password'];
  }

// To store in DB
  Map<String, dynamic> toMap() {
    Map<String, dynamic> rowMap = <String, dynamic>{};
    rowMap['firstName'] = firstName;
    rowMap['lastName'] = lastName;
    rowMap['email'] = email;
    rowMap['phone'] = phone;
    rowMap['password'] = password;
    return rowMap;
  }

}