import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBarW(),
      body: _bodyW(),
    );
  }
}

Widget AppBarW() {
  return AppBar(
    elevation: 0.0,
    leading: Icon(Icons.menu),
    actions: [
      GestureDetector(
        child: Container(
          margin: EdgeInsets.only(right: 10),
          child: Icon(Icons.notifications),
        ),
      ),
      GestureDetector(
        child: Container(
          margin: EdgeInsets.only(right: 10),
          child: Image.network(
            "https://ichef.bbci.co.uk/news/400/cpsprodpb/18309/production/_109218099_gettyimages-803015182.jpg",
            width: 60,
          ),
        ),
      )
    ],
  );
}

Widget _bodyW() {
  return Container(
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
          margin: EdgeInsets.only(top: 20, left: 30),
          child: Text(
            "Hi, Surat",
            style: TextStyle(
                fontSize: 25,
                color: Color(
                  0xff363636,
                ),
                fontFamily: "Poppins"),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 5, left: 20),
          child: Text(
            "Welcome Back",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),

        //Search bar
        Container(
          margin: EdgeInsets.only(top: 25, left: 20, right: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                  color: Color(0x14000000),
                  offset: Offset(0, 10),
                  blurRadius: 20),
            ],
          ),
          height: 60,
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: TextField(
                    maxLines: 1,
                    autofocus: true,
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Searching"),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xff1091613),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        //Catefor
        Container(
          margin: EdgeInsets.only(top: 20, left: 20),
          child: Stack(
            fit: StackFit.loose,
            children: [
              Container(
                child: Text(
                  "Category",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 20),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Show All",
                    style: TextStyle(fontSize: 19),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          color: Colors.transparent,
          height: 120,
          margin: EdgeInsets.only(top: 20, left: 20),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              demoCategories("images/tooth.png", "Tooth", "10 Doctors"),
              demoCategories("images/tooth.png", "Tooth", "10 Doctors"),
              demoCategories("images/tooth.png", "Tooth", "10 Doctors"),
              demoCategories("images/tooth.png", "Tooth", "10 Doctors"),
              demoCategories("images/tooth.png", "Tooth", "10 Doctors"),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20, left: 20),
          child: Stack(
            fit: StackFit.loose,
            children: [
              Container(
                child: Text(
                  "Top rated",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 20),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Show All",
                    style: TextStyle(fontSize: 19),
                  ),
                ),
              ),
            ],
          ),
        ),

        Expanded(
          child: Container(
            child: ListView(
              children: [
                rateDoctor("images/tooth.png"),
              ],
            ),
          ),
        )
      ],
    ),
  );
}

Widget rateDoctor(String doctorImage) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
    ),
    height: 90,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      //DOcImages
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Image.asset(doctorImage),
        )
      ],
    ),
  );
}

//ServiceCatalog design
Widget demoCategories(String image, String servicename, String drQuantity) {
  return Container(
    margin: EdgeInsets.only(right: 10),
    width: 100,
    decoration: BoxDecoration(
      color: Color(0xff107163),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //Images
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Image.asset(image),
        ),

        //Service Name
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text(
            servicename,
            style: TextStyle(
                color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500),
          ),
        ),

        //Doctor Q
        Container(
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color(0xffd9fffa).withOpacity(0.07),
          ),
          child: Text(
            drQuantity,
            style: TextStyle(
                color: Colors.white, fontSize: 8, fontWeight: FontWeight.w500),
          ),
        )
      ],
    ),
  );
}
