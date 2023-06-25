import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/database/database_controller.dart';
import 'package:note_app/storge/prefs_controller.dart';
import 'package:note_app/view/colors.dart';
import 'package:note_app/view/screens/app/about_screen.dart';
import 'package:note_app/view/screens/app/notes_screen.dart';
import 'package:note_app/view/screens/app/category_screen.dart';
import 'package:note_app/view/screens/app/profile_screen.dart';
import 'package:note_app/view/screens/app/settings_screen.dart';
import 'package:note_app/view/screens/launch_screen.dart';
import 'package:note_app/view/screens/login_screen.dart';
import 'package:note_app/view/screens/sign_up_screen.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefController().initPref();
  await DataBaseController().initDatabase();
  runApp(const MyApp());
}


MyColor myColor = MyColor();



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static final  ThemeData myTheme = ThemeData(
    primaryColor: myColor.primaryColor,
    secondaryHeaderColor: myColor.secondaryColor,
    fontFamily: 'Roboto',
    textTheme: TextTheme(
      headline1: TextStyle(
          fontSize: 30.0, fontFamily: 'Nunito', color: myColor.primaryColor),
      bodyText1: TextStyle(
        fontSize: 15.0,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w600,
        color: myColor.secondaryColor,
      ),
      bodyText2: TextStyle(
        fontSize: 22.0,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w600,
        color: myColor.secondaryColor,
      ) ,
      headline6:TextStyle(
  fontSize: 18.0,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w600,
  color: myColor.secondaryColor,
)  ,

      button: const TextStyle(
        fontSize: 20.0,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
headline2:  const TextStyle(
  color: Color(0xFF474559),
  fontSize: 22.0,
  fontFamily: 'Quicksand',
  fontWeight: FontWeight.bold,

),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: myTheme,
      initialRoute: '/launch_screen',
      routes: {
        '/launch_screen': (context) => const LaunchScreen(),
        '/login_screen': (context) => const LoginScreen(),
        '/sign_up_screen': (context) => const SignUpScreen(),
        '/category_screen':(context) => const CategoryScreen(),
        '/category_name_screen':(context) => const NotesScreen(categoryTitle: ''),
        '/settings_screen' : (context)=>  SettingsScreen(),
        '/about_screen' : (context)=> const AboutScreen(),
        '/profile_screen' : (context)=> const ProfileScreen(),
      },
    );
  }
}
