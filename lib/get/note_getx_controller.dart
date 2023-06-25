import 'package:get/get.dart';
import '../controller/note_db_controller.dart';
import '../model/note.dart';

class NoteGetController extends GetxController {

   NoteGetController({required this.categoryId});

   final int categoryId ;
  bool loading = false ;

  List<Note> notes = <Note>[];
  final NoteDbController dbController = NoteDbController();

   static NoteGetController get to => Get.find();

  @override
  void onInit() {
    read(categoryId: categoryId);
    super.onInit();
  }

  void read({required int categoryId}) async {
    loading = true ;
    notes = await dbController.read(categoryId);
    loading = false ;
    //notifyListeners(); // الرجاء من الجميع الاستماع فيه كارثة هتحصل
    update();
  }

  Future<bool> create ({required Note note}) async {
    int newRowId = await dbController.create(note);
    if(newRowId !=0){
      note.id = newRowId ; // وما يعمل تحميل انا بوفر وقت وأداء أفضل
      // عشان بدي اياه يعرضه لما يضيف
      notes.add(note);
     // notifyListeners();
      update();
    }
    return newRowId !=0 ;


  }

  Future<bool> deleteNote(int index) async{

    bool deleted = await dbController.delete(notes[index].id);
    if(deleted){
      // عشان يعمل تحديث للشاشة
      //int index = notes.indexWhere((element) => element.id == id);
       //notes.removeWhere((element) => element.id == id);
      //notifyListeners();
  notes.removeAt(index);
      /*if(index != -1) {
        notes.removeAt(index);
      }*/
       // notifyListeners();
        update();
      }
    return deleted ;
    }



// update , كلمة محجوزة في جيت
  Future<bool> updateNote ({required Note noteUpdated}) async {
    // هيستقبل النسخة المعدلة

    bool updated = await dbController.update(noteUpdated);
    if(updated){

      int index = notes.indexWhere((element) => element.id == noteUpdated.id);
      if(index != -1){
        //print(notes[index].id);
        //print(noteUpdated.id);

        notes[index] = noteUpdated ;
        //notifyListeners();
        update();
      }
    }

    return updated ;

  }







}