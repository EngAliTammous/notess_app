import 'package:flutter/material.dart';
import 'package:note_app/model/getFromPerfController.dart';
import 'package:note_app/storge/prefs_controller.dart';
import 'package:note_app/view/widgets/list_tile_setting_widget.dart';


class SettingsScreen extends StatelessWidget {
   SettingsScreen({Key? key}) : super(key: key);


  String charFirst =
 PrefController().getKey(key: PrefKeys.firstName.toString());

  String firstName = PrefController().getKey(key: PrefKeys.firstName.toString() );
   String lastName = PrefController().getKey(key: PrefKeys.lastName.toString() );

   String email = PrefController().getKey(key: PrefKeys.email.toString());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Setting',style:Theme.of(context).textTheme.headline2),
        leading: IconButton(
          icon:const Icon(Icons.arrow_back_ios_new,color: Colors.black,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
body: ListView(
  children: [
    SizedBox(height: MediaQuery.of(context).size.height/15,),
    CircleAvatar(
      backgroundColor: const Color(0xFF6A90F2),
       radius: MediaQuery.of(context).size.height/20,
        child: Text(GetFromPrefController().charFirst.substring(0,1),style:const TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          color: Colors.white

        ),),
    ),
    const SizedBox(height: 5,),
    Text(textAlign: TextAlign.center,
      '${GetFromPrefController().firstName} ${GetFromPrefController().lastName} ',style:const TextStyle(
      fontSize: 15.0,
      color: Colors.black,
      fontFamily: 'Quicksand',
    ),),
    const SizedBox(height: 5,),
    Text(email,
      textAlign: TextAlign.center,style:const TextStyle(
      fontSize: 13.0,
      color: Color(0xFFA5A5A5),
      fontFamily: 'Quicksand',
    ),),
   const Divider(
      indent: 50,
      endIndent: 50,
      color: Color(0xFFD0D0D0),
      thickness: 1.5,
    ),
   const ListTileSettingWidget(isRight: false
     , title: 'Language',
    subTitle: 'Selected language: EN',
     icon: Icons.language,
    ),
     ListTileSettingWidget(
       isRight: true
      , title: 'Profile',
      subTitle: 'Update your data',
      icon: Icons.person_outline,
      onTap: (){
      Navigator.pushNamed(context, '/profile_screen');
      },
    ),
     ListTileSettingWidget(isRight: false
      , title: 'About App',
      subTitle: 'What is notes app?',
      icon: Icons.device_unknown,
      onTap: (){
      Navigator.pushNamed(context, '/about_screen');
      },
    ),
     ListTileSettingWidget(
      onTap: (){
        Navigator.pushNamed(context, '/gsg_screen');
      },
      isRight: true
      , title: 'Logout',
      subTitle: 'Waiting your return',
      icon: Icons.logout,
    ),

  ],
),



    );
  }
}
