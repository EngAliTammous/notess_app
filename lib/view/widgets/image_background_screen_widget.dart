import 'package:flutter/material.dart';

class ImageBackgroundScreenWidget extends StatelessWidget {
  const ImageBackgroundScreenWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child ;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background_image.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        color: Colors.white.withOpacity(0.7),
        child: child ,
      ),
    );
  }
}
