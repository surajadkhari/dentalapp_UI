import 'dart:convert';

import 'package:flutter/material.dart';

import 'const/const.dart';
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
              Navigator.pushNamed(context, "/home");
            }
          },
        ),
        SizedBox(
          height: 10,
        ),
        LoginSingupbutton(
          text: "SING UP",
          onpressed: () {},
        ),
      ],
    );
  }
}

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

class TextFieldContainer extends StatelessWidget {
  final Widget child;

  TextFieldContainer({this.child});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.9,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.teal[200],
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}

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
                borderRadius: BorderRadius.circular(40))),
        onPressed: onpressed,
        child: Text(
          text,
          style: KWellogin_singupTTexTstle,
        ),
      ),
    );
  }
}
