
import 'package:flutter/material.dart';

mixin Helpers {

  void showMessage(
      BuildContext context,{required String message , bool error = false}){

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)
        , backgroundColor: error ? Colors.red : Colors.blue,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
        dismissDirection: DismissDirection.horizontal,

      ),
    );



  }



}