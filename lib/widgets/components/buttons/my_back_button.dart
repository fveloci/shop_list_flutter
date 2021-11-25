import 'package:flutter/material.dart';
import 'package:shop_list/utils/textApp.dart';

class MyBackButton extends StatelessWidget {
  const MyBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Icon(
              Icons.keyboard_arrow_left_rounded,
              color: Colors.white,
            ),
            Text(TextApp.BACK,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.white))
          ],
        ),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
