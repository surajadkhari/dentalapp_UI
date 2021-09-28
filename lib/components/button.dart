import 'package:dentalapp_UI/const/const.dart';

import 'package:flutter/material.dart';

class LoginSingupbutton extends StatelessWidget {
  final String text;
  final Color color;
  final Function onpressed;

  LoginSingupbutton({this.color, this.onpressed, this.text});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(80),
      ),
      width: size.width * 0.9,
      height: size.width * 0.2,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.teal,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        onPressed: onpressed,
        child: Text(
          text,
          style: KWellogin_singupTTexTstle,
        ),
      ),
    );
  }
}
