import 'dart:convert';

import 'package:dentalapp_UI/const/const.dart';
import 'package:dentalapp_UI/screen/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

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
  var selectedDay = "";
  var selectedTime = "";
  void setValue(value) {
    selectedDay = value;
  }

  void setTime(value) {
    setState(() {
      selectedTime = value;
    });
  }

  var isSelected = false;
  changeColor(bool t) {
    isSelected = t;
    isSelected ? Colors.red : Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    var dates = [];
    for (int i = 0; i <= 6; i++) {
      dates
          .add(DateFormat.EEEE().format(DateTime.now().add(Duration(days: i))));
    }

    var times = [];

    for (int i = 0; i <= 23; i++) {
      times.add(
          "${DateFormat.H().format(DateTime.now().add(Duration(hours: i)))} : 00");
    }

    print(times);

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
      body: Form(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Text(
                  "Choose Date and Time",
                  style: TextStyle(
                    color: Color(0xff363636),
                    fontSize: 20,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              Container(
                height: 120,
                width: double.infinity,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: dates.length,
                        itemBuilder: (context, index) =>
                            dateW(dates[index], () => setValue(dates[index])),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: times.length,
                        itemBuilder: (context, index) =>
                            timeW(times[index], () => setTime(times[index])),
                      ),
                    ),
                  ],
                ),
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
                      prefixIcon: Icon(Icons.health_and_safety),
                      hintText: "Service",
                      hintStyle: kinputRegistrationTextStyle),
                  isPassword: false,
                ),
              ),
              Container(
                child: Text(
                  selectedTime,
                  style: TextStyle(
                    color: Color(0xff363636),
                    fontSize: 12,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
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
                          'UserID': uid,
                          'Day': selectedDay,
                          'Time': selectedTime
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
    );
  }
}

Widget dateW(String date, Function onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Color(0xff107163),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        date,
        style:
            TextStyle(fontFamily: "Poppins", fontSize: 15, color: Colors.white),
      ),
    ),
  );
}

Widget timeW(String time, Function onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Color(0xff107163),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        time,
        style:
            TextStyle(fontFamily: "Poppins", fontSize: 15, color: Colors.white),
      ),
    ),
  );
}
