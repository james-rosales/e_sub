import 'package:e_sub/pages/splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SplashScreenBody(),
      ),
    );
  }
}
