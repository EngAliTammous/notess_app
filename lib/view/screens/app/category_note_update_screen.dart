
import 'package:flutter/material.dart';
import 'package:note_app/utils/helpers.dart';

import '../../../get/category_getx_controller.dart';
import '../../../get/note_getx_controller.dart';
import '../../../model/category.dart';
import '../../../model/note.dart';
import '../../../storge/prefs_controller.dart';
import '../../widgets/my_button_widget.dart';
import '../../widgets/my_text_field_widget.dart';


class CategoryNoteUpdateScreen extends StatefulWidget {
  const CategoryNoteUpdateScreen({Key? key, this.categoryTitleRetrive , required this.isCategoryUpdateScreen,  this.note , this.myCategoryVar}) : super(key: key);
  final bool  isCategoryUpdateScreen ;

  final Note? note ;
  final MyCategory? myCategoryVar ;
  final String? categoryTitleRetrive ;

  //final String? categoryTitleRetrive ;
  @override
  State<CategoryNoteUpdateScreen> createState() => _CategoryNoteUpdateScreenState();
}

class _CategoryNoteUpdateScreenState extends State<CategoryNoteUpdateScreen> with Helpers {


  late TextEditingController _categoryTitleController ;
  late TextEditingController _contentController ;

  @override
  void initState() {
    // TODO: implement initState
    _categoryTitleController = TextEditingController();
    _contentController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _categoryTitleController.dispose();
    _contentController.dispose();
    // TODO: implement dispose
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);

          },
          icon:const Icon(Icons.arrow_back_ios_new,color: Colors.black,),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 120),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(widget.isCategoryUpdateScreen?'Category Update':'Note Update',style: Theme.of(context).textTheme.headline1, ),
            const SizedBox(height: 7.0,),
            Text(widget.isCategoryUpdateScreen?'update category':'update note',style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 20.0,),
            MyTextFieldWidget(hintText: widget.isCategoryUpdateScreen?'Category Title':'Note Title ', controller: _categoryTitleController
            ),
            const SizedBox(height: 10.0,),

            MyTextFieldWidget(hintText:widget.isCategoryUpdateScreen?'Category Content': 'Note Content', controller: _contentController),
            const SizedBox(height: 20.0,),
            Row(
              children: [
                Expanded(
                  child: MyButtonWidget(
                      text: 'Save', onPressed: ()async{
                    //widget.isNoteScreen?Note object : Category object
                    //print(getIdOfTitle());
                    await performSave(context);
                  }
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

    );
  }


  bool checkData(){
    if(_categoryTitleController.text.isNotEmpty && _contentController.text.isNotEmpty){
      return true ;
    }
    showMessage(context, message: "Enter required data",error: true);
    return false ;
  }

  Future<void> performSave(BuildContext context) async{
    if(checkData()){
      await save(context);
    if (mounted) {
      Navigator.pop(context);
    }
    }
  }



  Future<void> save(BuildContext context) async {
    // create if null


    if (widget.isCategoryUpdateScreen) {
      bool saved = !isCreateCategory()?
      await CategoryGetController.to.updateCategory(
          categoryUpdated: myCategory):false;

      String message = saved ? 'Saved Successfully' : 'Saved failed';
    if (mounted){
      showMessage(context, message: message, error: !saved);
    }
      // if != null => update else create
      isCreateCategory() ? clear() : Navigator.popAndPushNamed(context, '/category_screen');
    }
    else {


      bool saved = !isCreateNote()
          ?
      await NoteGetController.to.updateNote(noteUpdated: note):false;


      String message = saved ? 'Saved Successfully' : 'Saved failed';
    if (mounted) {
      showMessage(context, message: message, error: !saved);}
      // if != null => update else create


      if (isCreateNote()){
        clear();
      }

    }
  }
  // if else => create category


  bool isCreateNote() => widget.note == null;

  bool isCreateCategory() => widget.myCategoryVar == null ;


  Note get note {
    Note note = Note();
    // means update process
    if(!isCreateNote()){
      // معناته النوت الجديدة الي بدي اعدل عليها بتساوي الاي دي القديم
      note.id = widget.note!.id ;
    }
    note.title = _categoryTitleController.text;
    note.content = _contentController.text;
    note.categoryId = getIdOfTitle();
    note.userId = PrefController().getKey<int>(key: PrefKeys.id.toString())!;


    return note ;

  }

  int getIdOfTitle (){
    if(widget.categoryTitleRetrive != null){
      MyCategory foundId = CategoryGetController.to.categoryList.firstWhere(
              (category) => category.title == widget.categoryTitleRetrive);
      //if(foundId != null)
      return foundId.id;
    }
    return 0 ;
  }

  MyCategory get myCategory{
    MyCategory category = MyCategory();
    // means update process
    if(!isCreateCategory()){
      // معناته النوت الجديدة الي بدي اعدل عليها بتساوي الاي دي القديم
      category.id = widget.myCategoryVar!.id;
    }
    category.title = _categoryTitleController.text.toString();
    category.content = _contentController.text.toString();
    category.userId = PrefController().getKey<int>(key: PrefKeys.id.toString())!;
    return category ;
  }

  void clear(){

      _categoryTitleController.text = '';
      _contentController.text = '';


  }


}
