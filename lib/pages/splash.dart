import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test1/pages/loginpage.dart';
import 'package:flutter_test1/pages/mainpage.dart';
import 'package:flutter_test1/provider/sign_in_provider.dart';
import 'package:flutter_test1/utils/config.dart';
import 'package:flutter_test1/utils/nextscreen.dart';
import 'package:provider/provider.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    final sp = context.read<SignIn>();
    super.initState();
    Timer(const Duration(seconds: 2), () {
      sp.isSignedIn == false
          ? nextScreen(context, const LoginPage())
          : nextScreen(context, const MainPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Image(
          image: AssetImage(Config.app_icon),
          height: 80,
          width: 80,
        )),
      ),
    );
  }
}
