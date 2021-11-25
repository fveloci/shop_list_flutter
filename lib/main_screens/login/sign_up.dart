import 'package:flutter/material.dart';
import 'package:shop_list/main_screens/login/login_screen.dart';
import 'package:shop_list/utils/textApp.dart';
import 'package:shop_list/widgets/components/buttons/login_button.dart';
import 'package:shop_list/widgets/components/buttons/my_back_button.dart';
import 'package:shop_list/widgets/components/buttons/sign_up_label.dart';
import 'package:shop_list/widgets/components/containers/container_shape01.dart';
import 'package:shop_list/widgets/components/fields/field_form.dart';
import 'package:shop_list/widgets/design/design_widgets.dart';

import '../homeScreen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Widget _formWidget() {
    return Column(
      children: [
        FieldForm(title: TextApp.USERNAME),
        FieldForm(title: TextApp.EMAIL_ID),
        FieldForm(title: TextApp.PASSWORD, isPassword: true)
      ],
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
                    child: _formWidget(),
                  ),
                  LoginButton(
                      text: TextApp.SIGNUP,
                      colorButtonBackground: Theme.of(context).primaryColor,
                      colorText: Colors.white,
                      widgetToNavigate: HomeScreen()),
                  SignUpLabel(
                    firstText: TextApp.HAVE_ACCOUNT,
                    secondText: TextApp.LOGIN,
                    secondTextColor: Theme.of(context).primaryColorDark,
                    widgetToNavigate: LoginScreen(),
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
