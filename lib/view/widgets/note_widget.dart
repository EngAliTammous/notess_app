import 'package:flutter/material.dart';


class NoteWidget extends StatelessWidget {
  const NoteWidget({Key? key,

  required this.noteContent ,
    required this.noteTitle,
    required this.onTap,
  }) : super(key: key);

  final String noteTitle ;
  final String noteContent ;
  final Function() onTap ;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin:const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
        width: 100,
        height: MediaQuery.of(context).size.height/5,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Colors.blue, Colors.blue],
          ),
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          padding: const EdgeInsets.symmetric(horizontal: 20.0 , vertical: 20.0),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
               Text(
                 noteTitle,
                textAlign: TextAlign.start,
                style:const TextStyle(

                fontFamily: 'Quicksand',
                fontSize: 15.0 ,
                //fontWeight: FontWeight.bold,
              ),
              ),
              const SizedBox(height: 7.0,),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width-130,
                    child:  Text( noteContent
                      ,style: const TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 14.0 ,
                    ),
                      softWrap: true,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Expanded(child: Image.asset('assets/images/check.png')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
