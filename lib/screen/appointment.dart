import 'dart:convert';

import 'package:dentalapp_UI/const/const.dart';
import 'package:dentalapp_UI/screen/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class appointmentDate extends StatefulWidget {
  // const appointmentDate({ Key? key }) : super(key: key);

  @override
  _appointmentDateState createState() => _appointmentDateState();
}

final _formKey = GlobalKey<FormState>();

class _appointmentDateState extends State<appointmentDate> {
  TextEditingController fullName = TextEditingController(text: '');
  TextEditingController contactNumber = TextEditingController(text: '');
  TextEditingController address = TextEditingController(text: '');
  TextEditingController service = TextEditingController(text: '');
  var uid;

  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context).settings.arguments as Map;
    if (arg != null) {
      uid = arg['uid'];
      print(uid);
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Appoinment",
            style: kappbarTitle,
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Center(
          child: Form(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    // child: Row(
                    //   children: [
                    //     Expanded(
                    //       child: Container(
                    //         margin: EdgeInsets.all(10),
                    //         height: 100,
                    //         decoration: BoxDecoration(
                    //           color: Colors.teal,
                    //           borderRadius: BorderRadius.circular(12),
                    //         ),
                    //         child: Column(
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           children: [
                    //             Text(
                    //               "SUN-MON",
                    //               style: kdateTextstyle,
                    //             ),
                    //             Text(
                    //               "9:00 AM -6:00 PM",
                    //               style: kdateTextstyle,
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    //     Expanded(
                    //         child: Container(
                    //       margin: EdgeInsets.all(8),
                    //       height: 100,
                    //       decoration: BoxDecoration(
                    //         color: Colors.teal,
                    //         borderRadius: BorderRadius.circular(12),
                    //       ),
                    //       child: Column(
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         children: [
                    //           Text(
                    //             "SATURDAY",
                    //             style: kdateTextstyle,
                    //           ),
                    //           Text(
                    //             "9:00 AM -1:00 PM",
                    //             style: kdateTextstyle,
                    //           ),
                    //         ],
                    //       ),
                    //     ))
                    //   ],
                    // ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InputField(
                      onChanged: (value) {
                        fullName.text = value;
                      },
                      validator: (val) =>
                          val.isEmpty ? "enter a valid eamil" : null,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: "Full Name",
                          hintStyle: kinputRegistrationTextStyle),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InputField(
                      onChanged: (value) {
                        contactNumber.text = value;
                      },
                      validator: (String val) => val.isEmpty || val.length < 10
                          ? "enter a valid number"
                          : null,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.phone),
                          hintText: "Contact Number",
                          hintStyle: kinputRegistrationTextStyle),
                      isPassword: false,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InputField(
                      onChanged: (value) {
                        address.text = value;
                      },
                      validator: (String val) =>
                          val.isEmpty ? "enter valid address" : null,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.place),
                          hintText: "Address",
                          hintStyle: kinputRegistrationTextStyle),
                      isPassword: false,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InputField(
                      onChanged: (value) {
                        service.text = value;
                      },
                      validator: (String val) =>
                          val.isEmpty ? "enter valid address" : null,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.place),
                          hintText: "Service",
                          hintStyle: kinputRegistrationTextStyle),
                      isPassword: false,
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        try {
                          final url =
                              'https://dentalapp-cb238-default-rtdb.firebaseio.com/appointment.json';
                          var response = await http.post(
                            Uri.parse(url),
                            body: jsonEncode({
                              'FullName': fullName.text,
                              'ContactNumber': contactNumber.text,
                              'Address': address.text,
                              'Service': service.text,
                              'UserID': uid
                            }),
                          );
                          Navigator.pop(context, "/home");
                          print(response.body);
                        } catch (e) {
                          print(e);
                        }
                      },
                      child: Text("Book Now"))
                ],
              ),
            ),
          ),
        ));
  }
}
