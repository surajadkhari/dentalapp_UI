import 'dart:convert';

import 'package:dentalapp_UI/const/const.dart';
import 'package:dentalapp_UI/screen/doctordetail.dart';
import 'package:dentalapp_UI/screen/services.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  // userName() async {
  //   final url =
  //       'https://dentalapp-cb238-default-rtdb.firebaseio.com/users.json';
  //   var response = await http.get(Uri.parse(url));
  //   var responseData = jsonDecode(response.body);
  //   var person;
  //   (responseData as Map).forEach((key, value) {
  //     if (value['UserID'] == '6ZqAhcLazHPCKdWivhffOF6AIU42')
  //       person = value['FullName'];
  //   });
  //   print(person);
  //   return print(response.body);
  // }

  FirebaseAuth _auth;
  var arg;
  var uname;
  var uid;

  void initState() {
    // TODO: implement initState
    Firebase.initializeApp().whenComplete(() {
      _auth = FirebaseAuth.instance;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    arg = ModalRoute.of(context).settings.arguments as Map;
    // print(arg);
    if (arg != null) {
      uname = arg['uname'];
      uid = arg['uid'];
    } else {
      uname = 'Not Provided';
    }

    return initScreen();
  }

  Widget initScreen() {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff053F5E),
      appBar: appBarW(),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, "/appointmentdate",
                arguments: {'uid': uid});
            // userName();
          },
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xff107163),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Icon(
                Icons.calendar_today,
                color: Colors.white,
                size: 25,
              ),
            ),
          )),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 5, left: 20),
              child: Text(
                "Hi $uname",
                style: TextStyle(
                  color: Color(0xff363636),
                  fontSize: 25,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 3, left: 20),
              child: Text(
                "Welcome Back",
                style: TextStyle(
                  color: Color(0xff363636),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 3, left: 20),
              child: Text(
                "Our Services Hour",
                style: TextStyle(
                  color: Color(0xff363636),
                  fontSize: 20,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              width: size.width,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x14000000),
                    offset: Offset(0, 10),
                    blurRadius: 15,
                    spreadRadius: 0,
                  ),
                ],
              ),
              // child: Row(
              //   children: [
              //     Expanded(
              //       flex: 4,
              //       child: Container(
              //         margin: EdgeInsets.only(left: 10, right: 10),
              //         child: TextField(
              //           maxLines: 1,
              //           autofocus: false,
              //           style:
              //               TextStyle(color: Color(0xff107163), fontSize: 20),
              //           decoration: InputDecoration(
              //             border: InputBorder.none,
              //             hintText: 'Search..',
              //           ),
              //           cursorColor: Color(0xff107163),
              //         ),
              //       ),
              //     ),
              //     Expanded(
              //       flex: 1,
              //       child: Container(
              //         decoration: BoxDecoration(
              //           color: Color(0xff107163),
              //           borderRadius: BorderRadius.circular(5),
              //         ),
              //         child: Center(
              //           child: Icon(
              //             Icons.search,
              //             color: Colors.white,
              //             size: 25,
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(2),
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "SUN-MON",
                            style: kdateTextstyle,
                          ),
                          Text(
                            "9:00 AM -6:00 PM",
                            style: kdateTextstyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(2),
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "SATURDAY",
                          style: kdateTextstyle,
                        ),
                        Text(
                          "9:00 AM -1:00 PM",
                          style: kdateTextstyle,
                        ),
                      ],
                    ),
                  ))
                ],
              ),
            ),
            Container(
              width: size.width,
              margin: EdgeInsets.only(top: 20, left: 20),
              child: Stack(
                fit: StackFit.loose,
                children: [
                  Container(
                    child: Text(
                      'Services',
                      style: TextStyle(
                        color: Color(0xff363636),
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20, top: 1),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ServicesDetail()));
                        },
                        child: Text(
                          'See all',
                          style: TextStyle(
                            color: Color(0xff5e5d5d),
                            fontSize: 19,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 120,
              margin: EdgeInsets.only(top: 10, left: 20),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  demoCategories("images/tooth.png", "Tooth", "10 Doctors"),
                  demoCategories("images/brain.png", "Brain", "15 Doctors"),
                  demoCategories("images/heart.png", "Heart", "17 Doctors"),
                  demoCategories("images/bone.png", "Bone", "24 Doctors"),
                ],
              ),
            ),
            Container(
              width: size.width,
              margin: EdgeInsets.only(top: 20, left: 20),
              child: Stack(
                fit: StackFit.loose,
                children: [
                  Container(
                    child: Text(
                      'Our Doctor ',
                      style: TextStyle(
                        color: Color(0xff363636),
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20, top: 1),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => doctorDetail()));
                        },
                        child: Text(
                          'See all',
                          style: TextStyle(
                            color: Color(0xff5e5d5d),
                            fontSize: 19,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: ListView(
                  children: [
                    demoTopRatedDr(
                      "images/doctor.png",
                      "Dr. Fred Mask",
                      "Oral & MAxillofacial",
                      "1245-565",
                      "",
                    ),
                    demoTopRatedDr(
                      "images/doctor.png",
                      "Dr. Fred Mask",
                      "Oral & MAxillofacial",
                      "1245-565",
                      "",
                    ),
                    demoTopRatedDr(
                      "images/doctor.png",
                      "Dr. Fred Mask",
                      "Oral & MAxillofacial",
                      "1245-565",
                      "",
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

//Appbar Widget
  Widget appBarW() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Color(0xff053F5E),
      centerTitle: true,
      leading: Icon(
        Icons.menu,
        color: Colors.white,
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, "/welcomescreen");
          },
          icon: Icon(Icons.logout),
        ),
        GestureDetector(
          child: Container(
            margin: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.notifications_rounded,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget demoCategories(String img, String name, String drCount) {
    return Container(
      width: 100,
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        color: Color(0xff107163),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Image.asset(img),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: Color(0xffd9fffa).withOpacity(0.07),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              drCount,
              style: TextStyle(
                color: Colors.white,
                fontSize: 8,
                fontFamily: 'Poppins',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget demoTopRatedDr(String img, String name, String speciality,
      String rating, String distance) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      //page route
      onTap: () {
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => DoctorDetailPage()));
      },
      child: Container(
        height: 90,
        // width: size.width,
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 20),
              height: 90,
              width: 50,
              child: Image.asset(img),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      name,
                      style: TextStyle(
                        color: Color(0xff363636),
                        fontSize: 17,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            color: Color(0xffababab),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 40, top: 10),
                          child: Row(
                            children: [
                              Container(
                                child: Text(
                                  "License: ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  rating,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
