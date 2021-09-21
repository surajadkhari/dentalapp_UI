import 'package:flutter/material.dart';

class ServicesDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ServicesDetailState();
}

class ServicesDetailState extends State<ServicesDetail> {
  @override
  Widget build(BuildContext context) {
    return initScreen();
  }

  Widget initScreen() {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff053F5E),
      appBar: appBarW(),
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
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: ListView(
                  children: [
                    demoTopRatedDr(
                      "images/tooth.png",
                      "Ticketing, Checkup & Counseling",
                      "Price",
                      "300",
                      "",
                    ),
                    demoTopRatedDr(
                      "images/tooth.png",
                      "X-Ray",
                      "Price",
                      "300",
                      "",
                    ),
                    demoTopRatedDr(
                      "images/tooth.png",
                      "Tooth Colored (Composite) Filling",
                      "Price",
                      "2000",
                      "",
                    ),
                    demoTopRatedDr(
                      "images/tooth.png",
                      "Scaling & Polishing",
                      "Price",
                      "1200",
                      "",
                    ),
                    demoTopRatedDr(
                      "images/tooth.png",
                      "Small Filling",
                      "Price",
                      "1000",
                      "",
                    ),
                    demoTopRatedDr(
                      "images/tooth.png",
                      "Medium Filling",
                      "Price",
                      "1000",
                      "",
                    ),
                    demoTopRatedDr(
                      "images/tooth.png",
                      "Medium Filling",
                      "Price",
                      "1000",
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
      title: Text(
        "services",
        style: TextStyle(
          color: Colors.white,
          fontSize: 23,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
      ),
      elevation: 0.0,
      backgroundColor: Color(0xff053F5E),
    );
  }

  Widget demoCategories(String img, String name, String drCount) {
    return Container(
      width: 100,
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        color: Colors.white,
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
          color: Color(0xff107163),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 20),
              height: 90,
              width: 60,
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
                        color: Colors.white,
                        fontSize: 15,
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
                          speciality,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(top: 3, left: size.width * 0.25),
                          child: Row(
                            children: [
                              Container(
                                child: Text(
                                  " ",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  rating,
                                  style: TextStyle(
                                    color: Colors.white,
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
