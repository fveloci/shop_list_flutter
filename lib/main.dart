import 'package:flutter/material.dart';
import 'package:shop_list/main_screens/homeScreen.dart';
import 'package:shop_list/main_screens/login/login_screen.dart';
import 'package:shop_list/utils/assetsImages.dart';
import 'package:shop_list/utils/constantsApp.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

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
          colorScheme: theme.colorScheme.copyWith(secondary: Color(0xffbee9ff)),
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: LoginScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
        navigateRoute: LoginScreen(),
        duration: 3,
        imageSize: 50,
        imageSrc: "assets/images/ic_launcher.png");
  }
}
