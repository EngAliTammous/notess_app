import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/get/note_getx_controller.dart';
import 'package:note_app/utils/helpers.dart';
import 'package:note_app/view/screens/app/category_note_update_screen.dart';
import '../../../get/category_getx_controller.dart';
import '../../../model/category.dart';
import '../../widgets/note_widget.dart';
import 'category_save_screen.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({Key? key,required this.categoryTitle}) : super(key: key);
  // This value pass to category save screen
   final String categoryTitle ;




  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> with Helpers {

   int getIdOfTitle (){
    MyCategory foundId = CategoryGetController.to.categoryList.firstWhere(
            (category) => category.title == widget.categoryTitle);
    //if(foundId != null)
    return foundId.id;
    //return 0 ;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
       title:Text(widget.categoryTitle,style:const TextStyle(
           color: Colors.black,
       fontSize: 22.0,
         fontFamily: 'Quicksand',
       ),) ,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new,color: Colors.black,),
        ),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (context) => CategorySaveScreen(
              isNoteScreen: true,
            // pass title to select category id
              categoryTitleRetrive: widget.categoryTitle,
            ),));

          }, icon:const Icon(Icons.add_circle,color: Colors.black,))
        ],
      ),
body: GetBuilder<NoteGetController>(
  init: NoteGetController(categoryId: getIdOfTitle()),

  global: true,
  builder:(controller) => ListView.builder(
    itemCount: NoteGetController.to.notes.length,
    itemBuilder:(context, index) {
      return  NoteWidget(
        onTap: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context)=>
              CategoryNoteUpdateScreen(
                isCategoryUpdateScreen: false ,
               note: controller.notes[index],

          ),
          ));
        },

        noteTitle: controller.notes[index].title,
        noteContent: controller.notes[index].content,

      );
    },
    physics: const BouncingScrollPhysics(),
  ),






),
    );
  }


   void delete(BuildContext context, int index) async {
     //NoteGetController noteGetController =
     bool deleted = await NoteGetController.to.deleteNote(index) ;
     String message = deleted ? 'Deleted Done':'Deleted Failed';
     showMessage(context, message: message, error: !deleted);
   }



}
