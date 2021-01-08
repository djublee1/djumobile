import 'package:djublee/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class Layout extends StatefulWidget {
  Layout({Key key}) : super(key: key);

  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  final TextEditingController _search = TextEditingController();

  int _currentIndex = 0;
  _tabs() {
    return [
      HomeScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Image.asset("assets/logo.png"),
          width: width * 0.3,
        ),
        backgroundColor: Colors.white,
        elevation: 10.0,
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: height * 40,
                width: width * 0.45,
                child: TextFormField(
                  controller: _search,
                  decoration: InputDecoration(
                    hintText: "Search mobil...",
                    hintStyle:
                        TextStyle(color: Color.fromRGBO(198, 231, 226, 1)),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color.fromRGBO(0, 150, 126, 1.0),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.only(
                      top: 0.00,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(198, 231, 226, 1)),
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(198, 231, 226, 1)),
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(198, 231, 226, 1)),
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                  ),
                  cursorColor: Colors.black,
                  style: TextStyle(color: Colors.black),
                ),
              )),
        ],
      ),
      body: SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: _tabs(),
        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.reactCircle,
        backgroundColor: Colors.white,
        color: Color.fromRGBO(112, 112, 112, 1.0),
        activeColor: Color.fromRGBO(0, 0, 0, 1.0),
        items: [
          TabItem(
            icon: _currentIndex == 0
                ? Image.asset("assets/home_active.png")
                : Image.asset("assets/home.png"),
            title: "Home",
          ),
          TabItem(
              icon: _currentIndex == 1
                  ? Image.asset("assets/market_active.png")
                  : Image.asset("assets/market.png"),
              title: "Market"),
          TabItem(
              icon: _currentIndex == 2
                  ? Image.asset("assets/mitra_active.png")
                  : Image.asset("assets/mitra.png"),
              title: "Mitra"),
          TabItem(
              icon: _currentIndex == 3
                  ? Image.asset("assets/lokasi_active.png")
                  : Image.asset("assets/lokasi.png"),
              title: "Location"),
          TabItem(
              icon: _currentIndex == 4
                  ? Image.asset("assets/profile_active.png")
                  : Image.asset("assets/profile.png"),
              title: "Profile"),
        ],
        initialActiveIndex: _currentIndex /*optional*/,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
