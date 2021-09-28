import 'dart:convert';

import 'package:dentalapp_UI/components/button.dart';
import 'package:dentalapp_UI/components/inputfield.dart';
import 'package:dentalapp_UI/const/const.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(child: Welcome()),
    );
  }
}

class Welcome extends StatelessWidget {
  TextEditingController email = TextEditingController(text: '');
  TextEditingController pass = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Container(
            margin: EdgeInsets.all(70),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child:
                  Image.asset("images/dentallogo.png", width: size.width * 0.6),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        InputField(
          isPassword: false,
          hintText: "Your Email",
          onChanged: (value) {
            email.text = value;
          },
          iconData: Icons.person,
        ),
        SizedBox(
          height: 10,
        ),
        InputField(
            isPassword: true,
            hintText: "Password",
            onChanged: (value) {
              pass.text = value;
            },
            iconData: Icons.lock),
        SizedBox(
          height: 10,
        ),
        Text(
          "Welcome to Dental",
          style: kWelcomeTextStyle,
        ),
        SizedBox(
          height: 10,
        ),
        LoginSingupbutton(
          text: "Login",
          onpressed: () async {
            // print(email.text);
            // print(pass.text);
            String url =
                "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyB7Y7nPvsY0tpP0h2DXKjROGjcJoGYWNeo";
            var response = await http.post(Uri.parse(url),
                body: jsonEncode({
                  'email': email.text,
                  'password': pass.text,
                  'returnSecureToken': true
                }));
            print(response.body);
            var resposeData = jsonDecode(response.body);
            if (resposeData['idToken'] != null) {
              print(resposeData['idToken']);
              Navigator.pushNamed(context, "/home", arguments: {
                "uname": resposeData['displayName'],
                'uid': resposeData['localId']
              });
            }
          },
        ),
        SizedBox(
          height: 10,
        ),
        LoginSingupbutton(
          text: "SIGN UP",
          onpressed: () {
            Navigator.pushNamed(context, "/registration_screen");
          },
        ),
      ],
    );
  }
}
