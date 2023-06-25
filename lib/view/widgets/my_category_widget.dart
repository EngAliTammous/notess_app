import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:note_app/get/note_getx_controller.dart';
import 'package:note_app/view/screens/app/notes_screen.dart';

import '../../get/category_getx_controller.dart';
import '../../model/category.dart';

class MyCategoryWidget extends StatelessWidget {
  const MyCategoryWidget(
      {Key? key, required this.title,
        required this.onPressedUpdate,
        required this.subTitle,required this.onPressedDelete,})
      : super(key: key);

  final String title;
final Function() onPressedDelete ;
  final String subTitle;
final Function() onPressedUpdate ;
  static final NoteGetController _noteController = Get.put(NoteGetController(categoryId: 0));

  int getIdOfTitle (){
      MyCategory foundId = CategoryGetController.to.categoryList.firstWhere(
      (category) => category.title == title);
      //if(foundId != null)
      return foundId.id;
  }



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

       Navigator.push(
            context, MaterialPageRoute(
           builder: (context) {
             return  NotesScreen(
               categoryTitle: title,
               // send category id
             );
           }

         //  settings: RouteSettings(name: 'id', arguments: [title])
       ));

       _noteController.read(categoryId: getIdOfTitle());

      },
      child: Container(
        padding: const EdgeInsets.only(left: 10.0),
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 7),

        height: MediaQuery.of(context).size.height / 10,
        //height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0.6,
              blurRadius: 3,
              offset: const Offset(1, 1), // shadow offset
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: MediaQuery.of(context).size.width / 14,
              backgroundColor: Colors.blue,
              child: Text(
                title.substring(0, 1),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Quicksand',
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                title: Text(
                  title,
                  style: const TextStyle(
                    //fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Quicksand',
                  ),
                ),
                subtitle: Text(
                  subTitle,
                  style: const TextStyle(
                    fontSize: 12.0,
                    fontFamily: 'Quicksand',
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: Color(0xFFD84040),
                  ),
                  onPressed: onPressedDelete,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 14,
              height: double.infinity,
              child: ElevatedButton(
                onPressed: onPressedUpdate,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child:  Icon(Icons.edit, size: 16.0),

                ),
              ),

          ],
        ),
      ),
    );
  }
}
