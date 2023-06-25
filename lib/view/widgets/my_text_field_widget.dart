import 'package:flutter/material.dart';


class MyTextFieldWidget extends StatelessWidget {
  const MyTextFieldWidget({
    required this.hintText,
    required this.controller ,
    Key? key,
  }) : super(key: key);
final String hintText ;
final TextEditingController controller ;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller ,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyText2,

        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).secondaryHeaderColor,
            width: 1 ,
          ),
        ),
      ),
    );
  }
}
