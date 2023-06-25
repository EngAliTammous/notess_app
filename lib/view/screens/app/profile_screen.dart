import 'package:flutter/material.dart';

import '../../../model/getFromPerfController.dart';
import '../../widgets/my_container_text_field_widget.dart';
import '../../widgets/my_text_field_widget.dart';
import '../../widgets/profile_container_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);



  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override

  late TextEditingController _firstNameController ;
  late TextEditingController _lastNameController ;
  late TextEditingController _phoneController ;
  late TextEditingController _emailController ;




  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        title: Text('Profile', style: Theme.of(context).textTheme.headline2),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 20,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 10,
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 19),
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 25,
               ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 0.6,
                  blurRadius: 3,
                  offset: const Offset(1, 1), // shadow offset
                ),
              ],
            ),
            child: Center(
              child: ListTile(
                leading: CircleAvatar(
                  radius: 40.0,
                  child:
                      Text(GetFromPrefController().charFirst.substring(0, 1)),
                ),
                title: Text(
                    '${GetFromPrefController().firstName} ${GetFromPrefController().lastName}'),
                subtitle: Text(GetFromPrefController().email),
              ),
            ),
          ),
           SizedBox(height: MediaQuery.of(context).size.height/18,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              ProfileContainerWidget(title: 'Categories' ,number: '14'),
              ProfileContainerWidget(title: 'Done Notes' ,number: '14'),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height/18,),

          /*MyContainerTextFieldWidget(
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
                  controller: _phoneController,
                  hintText: 'Phone',
                ),
                MyTextFieldWidget(
                  controller: _emailController,
                  hintText: 'Email',
                ),


              ],
            ),
          ),*/

          Container(
            width: 200,
            height: 180,
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            padding: EdgeInsets.symmetric(horizontal: 5.0) ,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black
              )
            ),
            child: Column(
              children: [
                ListTile(
                  leading: Container(
                      height: 80,
                      width: 80,
                      decoration:const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.greenAccent
                      ),
                      child:const Icon(Icons.person,color: Colors.red,)),
                title:const Text('Ali Tammous',style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),),
                subtitle:const Text('Flutter Developer ',style: TextStyle(
                    fontSize: 30
                ),) ,
                ),
                const SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('123 main'),
                    Text('123 main'),

                  ],
                ),
               const SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const[
                    Icon(Icons.add_circle),
                    Icon(Icons.add_circle),
                    Icon(Icons.add_circle),
                    Icon(Icons.add_circle),
                  ],
                )
              ],
            ),
          )

        ],
      ),
    );
  }
}
