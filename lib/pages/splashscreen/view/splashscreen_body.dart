import 'package:flutter/material.dart';

class SplashScreenBody extends StatelessWidget {
  const SplashScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          color: Colors.red,
          child: Image.asset(
            'assets/images/air-conditioner.png',
            scale: 2.5,
          ),
        ),
      ],
    );
  }
}
