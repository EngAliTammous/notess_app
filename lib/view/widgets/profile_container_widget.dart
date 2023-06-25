import 'package:flutter/material.dart';
import 'package:note_app/view/colors.dart';


class ProfileContainerWidget extends StatelessWidget {
 const  ProfileContainerWidget({Key? key,required this.title , required this.number}) : super(key: key);

  final String title ;
  final String number ;

  @override
  Widget build(BuildContext context) {
    return Container(
width: 110,
      height: 90,
decoration: BoxDecoration(
  color: Colors.white,
  boxShadow: [
    BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      spreadRadius: 0.6,
      blurRadius: 3,
      offset: const Offset(1, 1), // shadow offset
    ),
  ],
  borderRadius:const BorderRadius.all(Radius.circular(5.0)),
  border: Border.all(
     color: Colors.blue,
     width: 2.0,

  )
),

child: Column(
  children: [
    const Spacer(),
    Text(title,style: TextStyle(
      fontFamily: 'Roboto',
      color: MyColor().primaryColor,
      fontSize: 18.0
    ),),
       const SizedBox(height: 6.0,),
        Text(number,style: TextStyle(
        fontFamily: 'Roboto',
        color: MyColor().secondaryColor,
        fontSize: 15.0
    ),),
    const Spacer(),

  ],
),
    );
  }
}
