import 'package:flutter/material.dart';

import '../colors.dart';



class MyButtonWidget extends StatelessWidget {
  const MyButtonWidget({
    Key? key,

    required this.text,
    required this.onPressed ,

  }) : super(key: key);


final String text ;
final Function() onPressed ;
  static final MyColor myColor = MyColor();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: myColor.leadingColor,
        elevation: 0 ,
        minimumSize: Size(0, MediaQuery.of(context).size.height/15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      ),
      child: Text(text,style: Theme.of(context).textTheme.button,),
    );
  }
}

