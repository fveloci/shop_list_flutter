import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shop_list/main_screens/homeScreen.dart';
import 'package:shop_list/main_screens/login/login_screen.dart';
import 'package:shop_list/utils/assetsImages.dart';
import 'package:shop_list/utils/constantsApp.dart';
import 'package:shop_list/utils/login_service.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'dart:developer' as developer;

import 'main_screens/login/welcomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme.copyWith(
          primaryColor: Color(0xffff2776),
          primaryColorDark: Color(0xffc5004b),
          primaryColorLight: Color(0xffff69a4),
          colorScheme: theme.colorScheme.copyWith(
              primary: Color(0xffff2776), secondary: Color(0xffbee9ff)),
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Future<FirebaseApp> _firebaseInit = Firebase.initializeApp();
  static const String TAG = "Main";
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Object>(
        future: _firebaseInit,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            developer.log(TAG + ", Firebase init. ERROR");
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error inicializando Firebase')));
          } else if (snapshot.connectionState == ConnectionState.done) {
            developer.log(TAG + ", Firebase init. DONE");
            LoginService().googleSignIn.isSignedIn().then((user) {
              if (user) {
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) {
                  return HomeScreen();
                }));
              } else {
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) {
                  return LoginScreen();
                }));
              }
            });
            return SplashScreenView(
                navigateRoute: WelcomeScreen(),
                duration: 3,
                imageSize: 60,
                imageSrc: "assets/images/ic_launcher.png");
          }
          return CircularProgressIndicator();
        });
  }
}
