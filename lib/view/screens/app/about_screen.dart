import 'package:flutter/material.dart';
import 'package:note_app/view/widgets/image_background_screen_widget.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },
        icon:const Icon(Icons.arrow_back_ios_new,color: Colors.black,),
        ),
        title: const Text('About App',style: TextStyle(
          fontFamily: 'Quicksand',
          color: Color(0xFF474559),
          fontSize: 24.0,
        ),
        ),
      ),
      body: ImageBackgroundScreenWidget(
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width/1.55,
             height: MediaQuery.of(context).size.height/3.2,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.blue,
                  width: 5.0,

                ),
             borderRadius:const BorderRadius.all(Radius.circular(10.0))

              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/info_launch.png',
                  width:MediaQuery.of(context).size.width/3,
                  ),
                 const SizedBox(height: 5,),
                  Text('My Notes',style: Theme.of(context).textTheme.headline1,),
                 const SizedBox(height: 5,),
                  Text('For Organized Life',style: Theme.of(context).textTheme.bodyText1,),

                ],
              ),
            ),
          )


      ),
    );
  }
}
