import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/get/user_getx_controller.dart';
import 'package:note_app/utils/helpers.dart';
import 'package:note_app/view/colors.dart';
import 'package:note_app/view/widgets/image_background_screen_widget.dart';
import '../../get/note_getx_controller.dart';
import '../widgets/my_button_widget.dart';
import '../widgets/my_container_text_field_widget.dart';
import '../widgets/my_text_field_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

static final MyColor myColor = MyColor();

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with Helpers {

  static final UserGetController _controller = Get.put(UserGetController());

  late TextEditingController _emailTextFieldController ;
    late TextEditingController _passwordTextFieldController ;

@override
  void initState() {
  _emailTextFieldController = TextEditingController();
  _passwordTextFieldController = TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailTextFieldController.dispose();
    _passwordTextFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ImageBackgroundScreenWidget(
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 12,
            vertical: MediaQuery.of(context).size.height / 8,
          ),
          children: [
            const SizedBox(
              height: 20.0,
            ),
            Text(
              'Sign In,',
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(
              height: 5.0,
            ),
            Text(
              'Login to start using app,',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            // block text field
            MyContainerTextFieldWidget(
              marginSize: MediaQuery.of(context).size.height/15,
              paddingSize: MediaQuery.of(context).size.width / 18,
              heightContainer: MediaQuery.of(context).size.height / 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:  [
               MyTextFieldWidget(
                 controller: _emailTextFieldController ,
                    hintText: 'Email',
                  ),
                  MyTextFieldWidget(
                    controller: _passwordTextFieldController,
                    hintText: 'Password',
                  ),
                ],
              ),
            ),
             SizedBox(height: MediaQuery.of(context).size.height/25,),
            MyButtonWidget(
            text: 'Login',
              onPressed: (){
             performLogin();
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height/100,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Don’t have an account?',style: Theme.of(context).textTheme.headline6,),
            TextButton(onPressed: (){
              Navigator.pushNamed(context, '/sign_up_screen');
            }, child: Text('Sign Up',style: TextStyle(
              fontSize: 18.0,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w600,
              color: LoginScreen.myColor.primaryColor,
            ),))
          ],
        ),
          ],
        ),
      ),
    );
  }

  Future<void> performLogin() async {
    if(checkData(context)){
      await login();
    }
  }

  bool checkData(BuildContext context){
    if(_emailTextFieldController.text.isNotEmpty && _passwordTextFieldController.text.isNotEmpty){
      return true ;
    }
    showMessage(context, message: "Enter required data",error: true);
    return false ;
  }

  Future<void> login() async {
    bool logged = await _controller.login(
      email: _emailTextFieldController.text,
      password: _passwordTextFieldController.text,
    );
    if (logged) {
      Navigator.pushReplacementNamed( context, '/category_screen');
    }else {
      showMessage(context, message: 'email or password not correct',error: true);
    }
  }
}
