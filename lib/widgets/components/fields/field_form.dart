import 'package:flutter/material.dart';

class FieldForm extends StatelessWidget {
  const FieldForm({Key? key, this.title = "", this.isPassword = false})
      : super(key: key);

  final String title;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: TextField(
              obscureText: isPassword,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true),
            ),
          ),
        ],
      ),
    );
  }
}
