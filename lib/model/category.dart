class MyCategory {

  late int id ;
  late String title ;
  late String content ;
  late int userId ;

  MyCategory();

  // read from database
  MyCategory.fromMap(Map<String , dynamic> rowMap){
    id = rowMap['id']; // key , value
    // rowMap['id'] => return dynamic value
    title = rowMap['title'];
    content = rowMap['content'];
    userId = rowMap['userId'];

  }

  // store to database
  Map<String , dynamic> toMap(){
    Map<String , dynamic> rowMap = <String,dynamic>{};
    rowMap['title'] = title ;
    rowMap['content'] = content ;
    rowMap['userId'] = userId ;

    return rowMap ;
  }








}