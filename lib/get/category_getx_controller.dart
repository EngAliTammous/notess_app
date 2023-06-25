import 'package:get/get.dart';
import 'package:note_app/model/category.dart';
import '../controller/category_db_contoller.dart';



class CategoryGetController extends GetxController {



  @override
  void onInit() {
    read();
    super.onInit();

  }


  bool loading = false ;

  List<MyCategory> categoryList = <MyCategory>[];
  final CategoryDbController dbController = CategoryDbController();
  // بدلا من التكرار في كل فانكشن عشان يحدث ويبحث عن Get.put
  // بعملها مرة وحدة وبستدعيها
  static  CategoryGetController get to => Get.find<CategoryGetController>();



  void read() async {
    loading = true ;
    categoryList = await dbController.read(0);
    loading = false ;
    //notifyListeners(); // الرجاء من الجميع الاستماع فيه كارثة هتحصل
    update();
  }


  Future<bool> create ({required MyCategory category}) async {
    int newRowId = await dbController.create(category);
    if(newRowId !=0){
      category.id = newRowId ; // وما يعمل تحميل انا بوفر وقت وأداء أفضل
      // عشان بدي اياه يعرضه لما يضيف
      categoryList.add(category);
      // notifyListeners();
      update();
    }
    return newRowId !=0 ;


  }

  Future<bool> deleteCategory(int index) async{

    bool deleted = await dbController.delete(categoryList[index].id);
    if(deleted){

      categoryList.removeAt(index);

      update();
    }
    return deleted ;
  }

// update , كلمة محجوزة في جيت
  Future<bool> updateCategory ({required MyCategory categoryUpdated}) async {
    // هيستقبل النسخة المعدلة
    bool updated = await dbController.update(categoryUpdated);
    if(updated){

      int index = categoryList.indexWhere((element) => element.id == categoryUpdated.id);
      if(index != -1){
        categoryList[index] = categoryUpdated ;
        //notifyListeners();
        update();
      }
    }

    return updated ;

  }


}