import 'package:dentalapp_UI/screen/home_pagey.dart';
import 'package:dentalapp_UI/screen/homepage.dart';
import 'package:flutter/material.dart';

import 'screen/registration_screen.dart';
import 'screen/welcomescreen.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/home": (context) => HomePage(),
        "/welcomescreen": (context) => WelcomeScreen(),
        "/registration_screen": (context) => RegistrationScreen()
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color(0xff053F5E)),
      home: WelcomeScreen(),
    );
  }
}
