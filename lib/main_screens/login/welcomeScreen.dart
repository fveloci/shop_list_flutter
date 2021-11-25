import 'package:flutter/material.dart';
import 'package:shop_list/main_screens/login/login_screen.dart';
import 'package:shop_list/main_screens/login/sign_up.dart';
import 'package:shop_list/utils/textApp.dart';
import 'package:shop_list/widgets/components/buttons/login_button.dart';
import 'package:shop_list/widgets/design/design_widgets.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

Widget _signUpButton(BuildContext context) {
  return Container(
    width: double.infinity,
    child: TextButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUp()));
      },
      style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.all(15)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              side: BorderSide(
                  color: Theme.of(context).primaryColorLight,
                  width: 3,
                  style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(5.0)))),
      child: Text(
        TextApp.SIGNUP,
        style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold),
      ),
    ),
  );
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: DesignWidgets.linearGradientMain(context)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DesignWidgets.customTitle(),
                LoginButton(
                    text: TextApp.LOGIN,
                    colorButtonBackground: Colors.white,
                    colorText: Theme.of(context).primaryColor,
                    widgetToNavigate: LoginScreen()),
                _signUpButton(context)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
