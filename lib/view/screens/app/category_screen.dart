import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/get/category_getx_controller.dart';
import 'package:note_app/utils/helpers.dart';
import 'package:note_app/view/colors.dart';
import 'package:note_app/view/screens/app/category_note_update_screen.dart';
import 'package:note_app/view/screens/app/category_save_screen.dart';

import '../../widgets/my_category_widget.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> with Helpers{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(

        centerTitle: true,
        title: const Text(
          'Categories',
          style: TextStyle(
            fontSize: 22.0,
            color: Color(0xFF474559),
            fontFamily: 'Quicksand',
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: (){
                Navigator.pushNamed(context, '/settings_screen');
              },
              icon: const Icon(
                Icons.settings,
                color: Colors.black,
                size: 24.0,
              ),),
        ],
      ),
      body: GetBuilder<CategoryGetController>(
          init: CategoryGetController(),
          global: true,
          builder: (CategoryGetController controller) {
            return controller.categoryList.isNotEmpty?ListView.builder(
              itemCount: controller.categoryList.length,
              itemBuilder: (context, index) {
                return MyCategoryWidget(
                    title: controller.categoryList[index].title,
                    onPressedDelete: (){
                      delete(context, index);
                    },
                    onPressedUpdate: (){
                      Navigator.push(context,MaterialPageRoute(
                          builder:(context)=> CategoryNoteUpdateScreen(isCategoryUpdateScreen: true,myCategoryVar: controller.categoryList[index]),

                      ));
                    },
                    subTitle: controller.categoryList[index].content);
              },):Container();
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                const CategorySaveScreen(isNoteScreen: false,),
              ));
        },
        backgroundColor: MyColor.kLeadingColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  void delete(BuildContext context, int index) async {
    //NoteGetController noteGetController =
    bool deleted = await CategoryGetController.to.deleteCategory(index) ;
    String message = deleted ? 'Deleted Done':'Deleted Failed';
    showMessage(context, message: message, error: !deleted);
  }
}
