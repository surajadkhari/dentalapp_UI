import 'package:flutter/material.dart';

class doctorDetail extends StatefulWidget {
  @override
  _doctorDetailState createState() => _doctorDetailState();
}

class _doctorDetailState extends State<doctorDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Our Doctors",
          style: TextStyle(fontFamily: "Poppins"),
        ),
      ),
      body: Column(
        children: [
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
