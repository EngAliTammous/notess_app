import 'package:flutter/material.dart';

import '../widgets/image_background_screen_widget.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5),(){
      Navigator.pushNamed(context, '/login_screen');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ImageBackgroundScreenWidget(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/info_launch.png'),
              const SizedBox(height: 5.0,),
              Text('My Notes',
                style: Theme.of(context).textTheme.headline1,),
              const SizedBox(height: 5.0,),
              Text('For Organized Life',
                style: Theme.of(context).textTheme.bodyText1,),
            ],
          ),
        ),
      ),


    );
  }
}

