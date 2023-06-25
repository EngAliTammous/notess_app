import 'package:flutter/material.dart';

import 'my_text_field_widget.dart';


class MyContainerTextFieldWidget extends StatelessWidget {
  const MyContainerTextFieldWidget({
    required this.marginSize,
    required this.paddingSize,
    required this.heightContainer,
    required this.child,
    Key? key,
  }) : super(key: key);

  final double marginSize ;
  final double paddingSize ;
  final double heightContainer ;
final Widget child ;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:marginSize),
      padding: EdgeInsets.symmetric(
          horizontal: paddingSize),

      height: heightContainer,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color:Colors.black.withOpacity(0.3) ,blurRadius: 3.0,offset:const Offset(0,3)),
          ] ,
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0)),
      child: child,
    );
  }
}

