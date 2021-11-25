import 'dart:developer';
import 'dart:ui';

import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:shop_list/main_screens/homeScreen.dart';
import 'package:shop_list/main_screens/login/sign_up.dart';
import 'package:shop_list/utils/login_service.dart';
import 'package:shop_list/utils/textApp.dart';
import 'package:shop_list/widgets/components/buttons/login_button.dart';
import 'package:shop_list/widgets/components/buttons/my_back_button.dart';
import 'package:shop_list/widgets/components/buttons/sign_up_label.dart';
import 'package:shop_list/widgets/components/containers/container_shape01.dart';
import 'package:shop_list/widgets/components/fields/field_form.dart';
import 'package:shop_list/widgets/design/design_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Widget _emailPasswordWidget() {
    return Column(
      children: [
        FieldForm(title: TextApp.EMAIL_ID),
        FieldForm(title: TextApp.PASSWORD, isPassword: true)
      ],
    );
  }

  Widget _forgottenPassword() {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.centerRight,
        child: Text(TextApp.FORGOT_PASSWORD,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)));
  }

  Widget divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(
              thickness: 1,
            ),
          )),
          Text(TextApp.OR),
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(
              thickness: 1,
            ),
          ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: height * .15),
                    child: DesignWidgets.customDarkTitle(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height * .05),
                    child: _emailPasswordWidget(),
                  ),
                  LoginButton(
                      text: TextApp.LOGIN,
                      colorButtonBackground: Theme.of(context).primaryColor,
                      colorText: Colors.white,
                      widgetToNavigate: HomeScreen()),
                  _forgottenPassword(),
                  divider(),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    child: GoogleAuthButton(
                      onPressed: () {
                        LoginService().signInWithGoogle().then((result) => {
                              if (result != null)
                                {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => HomeScreen()))
                                }
                              else
                                {log("loginScreen build() ERROR")}
                            });
                      },
                      darkMode: false,
                      text: TextApp.GOOGLE_SIGN,
                    ),
                  ),
                  SignUpLabel(
                    firstText: TextApp.DONT_HAVE_ACCOUNT,
                    secondText: TextApp.SIGNUP,
                    secondTextColor: Theme.of(context).primaryColorDark,
                    widgetToNavigate: SignUp(),
                  )
                ],
              ),
            ),
          ),
          ContainerShape01(),
          Positioned(
            top: height * .025,
            child: MyBackButton(),
          ),
        ],
      )),
    );
  }
}
