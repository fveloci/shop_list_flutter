import 'package:flutter/material.dart';
import 'package:shop_list/main_screens/homeScreen.dart';
import 'package:shop_list/main_screens/login/login_screen.dart';
import 'package:shop_list/utils/textApp.dart';

class LoginButton extends StatelessWidget {
  final String text;
  final Color colorText;
  final Color colorButtonBackground;
  final Widget widgetToNavigate;

  LoginButton(
      {this.text = "",
      this.colorButtonBackground = const Color(0xffffff),
      this.colorText = const Color(0xffffff),
      this.widgetToNavigate = const HomeScreen()});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30.0, bottom: 25),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => widgetToNavigate));
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(colorButtonBackground),
            elevation: MaterialStateProperty.all(5.0),
            padding: MaterialStateProperty.all(EdgeInsets.all(15)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)))),
        child: Text(
          text,
          style: TextStyle(
              color: colorText,
              letterSpacing: 1.5,
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
