import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:djublee/screens/spesification_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> imgList = [
    '0',
    '1',
    '2',
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: height,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _headerFilter(),
              _contentCar(),
              _contentPromo(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerFilter() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.07,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Color.fromRGBO(216, 216, 216, 1.0), width: 2.0))),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 15.0,
          top: 8.0,
          bottom: 8.0,
          right: 15.0,
        ),
        child: Container(
          height: height * 0.04,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Baru",
                style: TextStyle(
                    color: Color.fromRGBO(96, 96, 96, 1.0),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    child: Image.asset("assets/urutkan.png"),
                    height: height * 0.02,
                  ),
                  SizedBox(
                    width: width * 0.01,
                  ),
                  Container(
                      child: Text(
                    "Urutkan",
                    style: TextStyle(
                        color: Color.fromRGBO(
                          120,
                          120,
                          120,
                          1.0,
                        ),
                        fontSize: 20),
                  )),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  Container(
                      child: Text(
                    "|",
                    style: TextStyle(
                        color: Color.fromRGBO(
                          227,
                          227,
                          227,
                          1.0,
                        ),
                        fontSize: 20),
                  )),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  Container(
                    child: Image.asset("assets/filter.png"),
                    height: height * 0.02,
                  ),
                  SizedBox(
                    width: width * 0.01,
                  ),
                  Container(
                      child: Text(
                    "Filter",
                    style: TextStyle(
                        color: Color.fromRGBO(
                          120,
                          120,
                          120,
                          1.0,
                        ),
                        fontSize: 20),
                  )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _contentCar() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Flexible(
        flex: 2,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            height: height,
            child: FittedBox(
              fit: BoxFit.fill,
              alignment: Alignment.topCenter,
              child: Row(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SpesificationScreen(id: "124",)),
                      );
                    },
                    child: Container(
                        width: 85,
                        margin: EdgeInsets.only(right: 5),
                        height: height * 0.23,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 1.0), //(x,y)
                              blurRadius: 1.0,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            _contentCarHeader(),
                            _contentCarFoto(true),
                            _contentCarName(true),
                            _contentCarDesc()
                          ],
                        )),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                        width: 85,
                        margin: EdgeInsets.only(right: 5),
                        height: height * 0.23,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 1.0), //(x,y)
                              blurRadius: 1.0,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            _contentCarHeader(),
                            _contentCarFoto(false),
                            _contentCarName(false),
                            _contentCarDesc()
                          ],
                        )),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                        width: 85,
                        margin: EdgeInsets.only(right: 5),
                        height: height * 0.23,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 1.0), //(x,y)
                              blurRadius: 1.0,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            _contentCarHeader(),
                            _contentCarFoto(true),
                            _contentCarName(true),
                            _contentCarDesc()
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _contentCarHeader() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.034,
      width: width * 1.0,
      decoration: BoxDecoration(
        color: Color.fromRGBO(209, 214, 22, 1.0),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
        gradient: LinearGradient(
            colors: [
              Color.fromRGBO(243, 243, 228, 1.0),
              Color.fromRGBO(209, 214, 22, 1.0)
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(0.5, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              "Harga jual terendah",
              style: TextStyle(
                  fontSize: 7, color: Color.fromRGBO(101, 101, 10, 1.0)),
              maxLines: 1,
            ),
          ),
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              "Rp. 150.000.000.000",
              style: TextStyle(
                  fontSize: 7,
                  color: Color.fromRGBO(101, 101, 10, 1.0),
                  fontWeight: FontWeight.bold),
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _contentCarFoto(bool isTrue) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
        // height: height * 0.09,
        // width: width * 1.0,
        child: isTrue
            ? Image.asset("assets/Jazz.png")
            : Image.asset("assets/Jazz.png"));
  }

  Widget _contentCarName(bool isTrue) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.034,
      width: width * 1.0,
      decoration: BoxDecoration(
        color: Color.fromRGBO(0, 150, 126, 1.0),
        gradient: LinearGradient(
            colors: [
              Color.fromRGBO(29, 191, 165, 1.0),
              Color.fromRGBO(36, 121, 104, 1.0)
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(0.4, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    isTrue ? "Suzuki" : "Honda",
                    style: TextStyle(
                        fontSize: 7,
                        color: Color.fromRGBO(225, 225, 225, 1.0),
                        fontWeight: FontWeight.bold),
                    maxLines: 1,
                  ),
                ),
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    isTrue ? "Ertiga 2.5 G" : "Jazz RS CVT",
                    style: TextStyle(
                        fontSize: 7,
                        color: Color.fromRGBO(225, 225, 225, 1.0),
                        fontWeight: FontWeight.bold),
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Text(
              isTrue ? "2016" : "2018",
              style: TextStyle(
                  fontSize: 7, color: Color.fromRGBO(225, 225, 225, 1.0)),
            ),
          )
        ],
      ),
    );
  }

  Widget _contentCarDesc() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width * 1.0,
      child: Padding(
        padding: const EdgeInsets.only(right: 5, left: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 3,
            ),
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                "Market Price",
                style: TextStyle(
                    fontSize: 7, color: Color.fromRGBO(0, 150, 126, 1.0)),
                maxLines: 1,
              ),
            ),
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                "Rp. 150.000.000",
                style: TextStyle(
                    fontSize: 7,
                    color: Color.fromRGBO(0, 150, 126, 1.0),
                    fontWeight: FontWeight.bold),
                maxLines: 1,
              ),
            ),
            SizedBox(
              height: 3,
            ),
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                "Transaksi terakhir",
                style: TextStyle(
                    fontSize: 7, color: Color.fromRGBO(0, 150, 126, 1.0)),
                maxLines: 1,
              ),
            ),
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                "Rp. 90.000.000",
                style: TextStyle(
                    fontSize: 7,
                    color: Color.fromRGBO(116, 185, 68, 1.0),
                    fontWeight: FontWeight.bold),
                maxLines: 1,
              ),
            ),
            SizedBox(
              height: 3,
            ),
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                "Jumlah transaksi",
                style: TextStyle(
                    fontSize: 7, color: Color.fromRGBO(0, 150, 126, 1.0)),
                maxLines: 1,
              ),
            ),
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                "2 Mobil",
                style: TextStyle(
                    fontSize: 7,
                    color: Color.fromRGBO(209, 214, 22, 1.0),
                    fontWeight: FontWeight.bold),
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _contentPromo() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final List<Widget> imageSliders = imgList
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.asset(
                          "assets/promo${item}.png",
                          fit: BoxFit.cover,
                          width: width * 1.0,
                          height: height * 1.0,
                        ),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10.0),
                            child: Text(
                              '',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ))
        .toList();
    return Expanded(
      flex: 1,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text("Promo",
                style: TextStyle(
                    color: Color.fromRGBO(96, 96, 96, 1.0),
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            Container(
                child: Column(
              children: <Widget>[
                CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                  ),
                  items: imageSliders,
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }


}
