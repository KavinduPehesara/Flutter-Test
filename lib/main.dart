import 'dart:io';
import 'package:flutter_test1/provider/internet_provider.dart';
import 'package:flutter_test1/provider/sign_in_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test1/pages/splash.dart';
import 'package:provider/provider.dart';

void main() async {
  print("Initializing Flutter app...");
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
          apiKey: 'AIzaSyBQdezE6U5sOykgcEygLd3FCq2YTMtEuts',
          appId: '1:162516890803:android:f000a20e58624cdfa7ecc6',
          messagingSenderId: '162516890803',
          projectId: 'my-test-project-f2bd4',
        ))
      : await Firebase.initializeApp();

  print("Firebase initialized successfully.");
  runApp(const testapp());
}

class testapp extends StatelessWidget {
  const testapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ((context) => SignIn()),
        ),
        ChangeNotifierProvider(
          create: ((context) => InternetProvider()),
        ),
      ],
      child: const MaterialApp(
        home: Splash(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
