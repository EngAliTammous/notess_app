import 'package:flutter/material.dart';


class ListTileSettingWidget extends StatelessWidget {
  const ListTileSettingWidget({Key? key,required this.isRight,
  required this.title,
    required this.subTitle,
required this.icon,
    this.onTap
  }) : super(key: key);
final bool isRight ;


final String title ;
final String subTitle ;
final IconData icon ;
final Function()? onTap ;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin:const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),

        clipBehavior: Clip.antiAliasWithSaveLayer,
        height: 80,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            bottomLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            bottomLeft: Radius.circular(10.0),
          ),
          child: Container(
            decoration:  BoxDecoration(
              border: Border(
right:isRight?const BorderSide(
  color: Colors.blue,
  width: 5.0,
):const BorderSide(width: 0 , color: Colors.white) ,
                left: !isRight?const BorderSide(
                  color: Colors.blue,
                  width: 5.0,
                ):const BorderSide(
                 width: 0 ,
                  color: Colors.white,
                ),
              ),
            ),
            child: Center(
              child: ListTile(
                title: Text(title,style:  TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: MediaQuery.of(context).size.height/50,
                ),
                ),
                subtitle: Text(subTitle,style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: MediaQuery.of(context).size.height/55 ,
                ),),
                leading: CircleAvatar(

                  radius: 30,
child: Center(child: Icon(icon,color: Colors.white,)) ,
                ),
                trailing:const Icon(Icons.arrow_forward_ios,color: Colors.black,size: 15,),
              ),
            ),
          ),
        ),
      ),
    );


  }
}
