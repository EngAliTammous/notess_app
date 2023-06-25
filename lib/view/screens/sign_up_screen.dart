import 'package:flutter/material.dart';
import 'package:note_app/get/user_getx_controller.dart';
import 'package:note_app/utils/helpers.dart';
import 'package:note_app/view/widgets/image_background_screen_widget.dart';

import '../../model/user.dart';
import '../widgets/my_button_widget.dart';
import '../widgets/my_container_text_field_widget.dart';
import '../widgets/my_text_field_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> with Helpers {



  late TextEditingController _firstNameController ;
  late TextEditingController _lastNameController ;
  late TextEditingController _emailController ;
  late TextEditingController _phoneController ;
  late TextEditingController _passwordController ;



  @override
  void initState() {
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar:AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },icon:const Icon(Icons.arrow_back_ios_new,color: Colors.black,),) ,
      ),
      body: ImageBackgroundScreenWidget(
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 12,
            vertical: MediaQuery.of(context).size.height / 10,
          ),
          children: [
            Text('Sign Up',style: Theme.of(context).textTheme.headline1,
            textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 5.0,
            ),
            Text(
              'Create an account,',
              style: Theme.of(context).textTheme.bodyText1,
              textAlign: TextAlign.center,
            ),
            MyContainerTextFieldWidget(
              marginSize: MediaQuery.of(context).size.height/15,
              paddingSize: MediaQuery.of(context).size.width / 18,
              heightContainer: MediaQuery.of(context).size.height / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:  [
                  MyTextFieldWidget(
                    controller: _firstNameController,
                    hintText: 'First Name',
                  ),
                  MyTextFieldWidget(
                    controller: _lastNameController,
                    hintText: 'Last Name',
                  ),
                  MyTextFieldWidget(
                    controller: _emailController,
                    hintText: 'Email',
                  ),
                  MyTextFieldWidget(
                    controller: _phoneController,
                    hintText: 'Phone',
                  ),
                  MyTextFieldWidget(
                    controller: _passwordController,
                    hintText: 'Password',
                  ),

                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/25,),
            MyButtonWidget(
              text: 'Sign Up',
              onPressed: () async{
              await  performSignUp();
              },
            ),

          ],
        ),
      ),
    );
  }


  Future<void> performSignUp() async {
    if(checkData(context)){
      await signUp();
    }
  }

  bool checkData(BuildContext context){
    if(_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty){
      return true ;
    }
    showMessage(context, message: "Enter required data",error: true);
    return false ;
  }

  Future<void> signUp() async {
    bool createAccount = await UserGetController().create(user: user);
    if (createAccount) {
      Navigator.pushReplacementNamed( context, '/login_screen');
    }else {
      showMessage(context, message: 'create of account, failed!',error: true);
    }
  }
  User get user {
    User user = User();
    user.firstName = _firstNameController.text ;
    user.lastName = _lastNameController.text ;
    user.email = _emailController.text;
    user.phone = _phoneController.text;
    user.password = _passwordController.text;
    return user ;
  }



}
