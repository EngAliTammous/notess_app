
class Note {
  late int id ;
  late String title ;
  late String content ;
  late int userId ;
  late int categoryId ;
  Note();

  // read from database
  Note.fromMap(Map<String , dynamic> rowMap){
    id = rowMap['id']; // key , value
    // rowMap['id'] => return dynamic value
    title = rowMap['title'];
    content = rowMap['content'];
    userId = rowMap['userId'];
    categoryId = rowMap['categoryId'];
  }

   // store to database
  Map<String , dynamic> toMap(){
    Map<String , dynamic> rowMap = <String,dynamic>{};

    rowMap['title'] = title ;
    rowMap['content'] = content ;
    rowMap['userId'] = userId ;
    rowMap['categoryId'] = categoryId ;
    return rowMap ;
  }

}