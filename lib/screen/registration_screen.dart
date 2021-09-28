import 'package:dentalapp_UI/components/button.dart';
import 'package:dentalapp_UI/const/const.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  FirebaseAuth _auth;
  final _formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController(text: '');
  TextEditingController password = TextEditingController(text: '');
  TextEditingController fullName = TextEditingController(text: '');
  TextEditingController confirmpassword = TextEditingController(text: '');
  TextEditingController number = TextEditingController(text: '');
  TextEditingController address = TextEditingController(text: '');
  @override
  void initState() {
    // TODO: implement initState
    Firebase.initializeApp().whenComplete(() {
      _auth = FirebaseAuth.instance;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "/welcomescreen");
          },
          child: Icon(Icons.arrow_back),
        ),
        title: Text(
          "Register for Login",
          style: kappbarTitle,
        ),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InputField(
                    onChanged: (value) {
                      fullName.text = value;
                    },
                    validator: (val) => val.isEmpty ? "enter full name" : null,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: "Full Name",
                        hintStyle: kinputRegistrationTextStyle),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InputField(
                    onChanged: (value) {
                      email.text = value;
                    },
                    validator: (val) => val.isEmpty || !val.contains("@")
                        ? "enter a valid eamil"
                        : null,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.mail),
                        hintText: "Email",
                        hintStyle: kinputRegistrationTextStyle),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(10.0),
                //   child: InputField(
                //     onChanged: (value) {
                //       number.text = value;
                //     },
                //     validator: (String val) => val.isEmpty || val.length < 10
                //         ? "enter a valid number"
                //         : null,
                //     decoration: InputDecoration(
                //         prefixIcon: Icon(Icons.phone),
                //         hintText: "Contact Number",
                //         hintStyle: kinputRegistrationTextStyle),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.all(10.0),
                //   child: InputField(
                //     onChanged: (value) {
                //       address.text = value;
                //     },
                //     validator: (val) => val.isEmpty ? "enter a address" : null,
                //     decoration: InputDecoration(
                //         prefixIcon: Icon(Icons.place),
                //         hintText: "Address",
                //         hintStyle: kinputRegistrationTextStyle),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InputField(
                    onChanged: (value) {
                      password.text = value;
                    },
                    validator: (String val) => val.isEmpty || val.length < 6
                        ? "enter a valid password"
                        : null,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        hintText: "Password",
                        helperStyle: kinputRegistrationTextStyle),
                    isPassword: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InputField(
                    onChanged: (value) {
                      confirmpassword.text = value;
                    },
                    validator: (String val) =>
                        val.isEmpty || val != password.text
                            ? "password did not match"
                            : null,
                    isPassword: true,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        hintText: "Confirm Password",
                        hintStyle: kinputRegistrationTextStyle),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                LoginSingupbutton(
                    text: "SING UP",
                    onpressed: () async {
                      if (_formKey.currentState.validate()) {
                        try {
                          final UserCredential newUser =
                              await _auth.createUserWithEmailAndPassword(
                            email: email.text,
                            password: password.text,
                          );

                          if (newUser != null) {
                            var uId = newUser.user.uid;
                            newUser.user.updateDisplayName(fullName.text);

                            // final url =
                            //     'https://dentalapp-cb238-default-rtdb.firebaseio.com/users/$uId.json';
                            // var response = await http.post(
                            //   Uri.parse(url),
                            //   body: jsonEncode({
                            //     'FullName': fullName.text,
                            //     'email': email.text,
                            //   }),
                            // );
                            Navigator.pushNamed(context, "/welcomescreen");
                          }
                        } catch (e) {
                          print(e);
                        }
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final InputDecoration decoration;
  final bool isPassword;
  final Function validator;
  final Function onChanged;
  InputField(
      {this.hintText,
      this.icon,
      this.decoration,
      this.isPassword = false,
      this.validator,
      this.onChanged});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: decoration,
      obscureText: isPassword,
      validator: validator,
      onChanged: onChanged,
    );
  }
}
