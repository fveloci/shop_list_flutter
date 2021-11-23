import 'package:flutter/material.dart';
import 'package:shop_list/utils/textApp.dart';
import 'package:shop_list/widgets/design/design_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

Widget _loginButton(BuildContext context) {
  return Container(
    padding: EdgeInsets.only(top: 50.0, bottom: 25),
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () => print('Boton iniciar sesion'),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          elevation: MaterialStateProperty.all(5.0),
          padding: MaterialStateProperty.all(EdgeInsets.all(15)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0)))),
      child: Text(
        TextApp.LOGIN,
        style: TextStyle(
            color: Theme.of(context).primaryColor,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget _signUpButton(BuildContext context) {
  return Container(
    width: double.infinity,
    child: TextButton(
      onPressed: () => print('Boton registrarse'),
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

class _LoginScreenState extends State<LoginScreen> {
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
                _loginButton(context),
                _signUpButton(context)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
