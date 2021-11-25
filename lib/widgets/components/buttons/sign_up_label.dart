import 'package:flutter/material.dart';
import 'package:shop_list/main_screens/homeScreen.dart';
import 'package:shop_list/utils/textApp.dart';

class SignUpLabel extends StatelessWidget {
  final String firstText;
  final String secondText;
  final Color secondTextColor;
  final Widget widgetToNavigate;

  SignUpLabel(
      {this.firstText = "",
      this.secondText = "",
      this.secondTextColor = const Color(0xff),
      this.widgetToNavigate = const HomeScreen()});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.pop(context);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => widgetToNavigate));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(firstText,
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.black)),
            SizedBox(),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(secondText,
                  style: TextStyle(
                      color: secondTextColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w600)),
            )
          ],
        ));
  }
}
