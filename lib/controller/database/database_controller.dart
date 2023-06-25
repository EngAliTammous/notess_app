import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';


class DataBaseController {
  static final DataBaseController _instance = DataBaseController._();
  late Database _database ;

  factory DataBaseController(){
    return _instance;
  }

  DataBaseController._();

  //  ارجاع قاعدة البيانات المنشئة
// عشان اتحكم فيها بالكنترولر
  Database get database => _database ;


  // الهدف منها جلب مسار حفظ الملفات بناء
// على نظام الهاتف المستخدم من خلال (pathProvider package)
  Future<void> initDatabase() async {
    // تقوم بفحص نظام الهاتف وبناء عليه تحدد مسار حفظ الملفات
    Directory directory = await getApplicationDocumentsDirectory();
    // اذن بعد ما تم فحص الجهاز وتم جلب المسار الي بدنا نخزن الداتا بيز فيه
    // join inside path package
    String path = join(directory.path,'db_sql');
    // الان بدنا نقوم بفتح او انشاء قاعدة البيانات
    _database =  await  openDatabase(path,
      version: 1,
      /*
     * في حال ما فيه داتا بيز onCreate بتتكفل بالنوضوع وبتنشئها
     *طيب في حال انا رافع الابليكشن بتاعي على المتجر واصدار قاعدة البيانات 1 وانا حدثتها ل 2
     * هيتكفل بالامر ال upGrade والعكس downGrade
     *
     *
     * */
      onOpen:  (Database db){},
      onCreate: (Database db , int version) async{
        await db.execute('CREATE TABLE users ( '
            'id INTEGER PRIMARY KEY AUTOINCREMENT,'
            'firstName TEXT NOT NULL ,'
            'lastName TEXT NOT NULL ,'
            'email TEXT NOT NULL ,'
            'phone TEXT ,'
            'password TEXT'
            ')');
        await db.execute('CREATE TABLE categories ( '
            'id INTEGER PRIMARY KEY AUTOINCREMENT,'
            'title TEXT  ,'
            'content TEXT ,'
            'userId INTEGER , '
            'FOREIGN KEY (userId) REFERENCES users (id) ON DELETE RESTRICT ON UPDATE CASCADE'
            ')');

        await db.execute('CREATE TABLE notes ( '
            'id INTEGER PRIMARY KEY AUTOINCREMENT,'
            'title TEXT  ,'
            'content TEXT ,'
            'categoryId INTEGER , '
            'userId INTEGER , '
            'FOREIGN KEY (categoryId) REFERENCES categories (id) ON DELETE RESTRICT ON UPDATE CASCADE ,'
            'FOREIGN KEY (userId) REFERENCES users (id) ON DELETE RESTRICT ON UPDATE CASCADE'
            ')');
// ON DELETE RESTRICT ON UPDATE CASCADE
// عند حذف اليوزر واله نود  امنعه من الحذف ، عند التعديل
        // اسمح اله بتعديل كل النود المرتبطة ، يعني لو خليت عند الحذف Cascade هيحذف كل الارتباطات
      },
      onUpgrade: (Database db , int oldVersion , int newVersion){},
      onDowngrade: (Database db , int oldVersion , int newVersion){},

    );

  }
// each table in db has controller

}