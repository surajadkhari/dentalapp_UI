import 'package:dentalapp_UI/components/inputfieldcontainer.dart';
import 'package:dentalapp_UI/const/const.dart';

import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final IconData iconData;
  final bool isPassword;
  final ValueChanged<String> onChanged;

  InputField({this.hintText, this.iconData, this.onChanged, this.isPassword});
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: isPassword,
        keyboardType: TextInputType.visiblePassword,
        onChanged: onChanged,
        decoration: InputDecoration(
            border: InputBorder.none,
            icon: Icon(iconData),
            hintText: hintText,
            hintStyle: KinputTTexTstle),
      ),
    );
  }
}
