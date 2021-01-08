import 'dart:convert';

import 'package:djublee/bloc/spesifikasi_bloc.dart';
import 'package:djublee/conts/conts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SpesificationListScreen extends StatefulWidget {
  final choices;
  final String id;
  final functionChangePhoto;
  SpesificationListScreen({Key key, @required this.choices, this.id, this.functionChangePhoto}) : super(key: key);

  @override
  _SpesificationListScreenState createState() =>
      _SpesificationListScreenState(choices);
}

class _SpesificationListScreenState extends State<SpesificationListScreen>
    with TickerProviderStateMixin {
  TabController _tabController;
  _SpesificationListScreenState(choices);

  @override
  void initState() {
    // TODO: implement initState
    spesifikasiBloc..getMesin(widget.id);
    spesifikasiBloc..getPerforma(widget.id);
    spesifikasiBloc..getDimensi(widget.id);
    spesifikasiBloc..getExterior(widget.id);
    spesifikasiBloc..getInterior(widget.id);
    spesifikasiBloc..getSafety(widget.id);
    spesifikasiBloc..getEntertaiment(widget.id);
    _tabController = TabController(vsync: this, length: choices.length);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Container(
        height: height * 1.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 7.0,
            ),
          ],
        ),
        child: DefaultTabController(
          length: choices.length,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: PreferredSize(
              child: AppBar(
                backgroundColor: Colors.white,
                elevation: 0.0,
                bottom: TabBar(
                    onTap: (index){
                      if(index == 0){
                        widget.functionChangePhoto("Eksterior");
                      }else if(index == 1){
                        widget.functionChangePhoto("Interior");
                      }else if(index == 2){
                        widget.functionChangePhoto("Dimensi");
                      }else if(index == 3){
                        widget.functionChangePhoto("Mesin");
                      }else if(index == 4){
                        widget.functionChangePhoto("Performa");
                      }else if(index == 5){
                        widget.functionChangePhoto("Safety");
                      }else if(index == 6){
                        widget.functionChangePhoto("Entertaiment");
                      }
                    },
                    controller: _tabController,
                    indicatorColor: Color.fromRGBO(96, 96, 96, 1.0),
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorWeight: 3.0,
                    // unselectedLabelColor: ,
                    labelColor: Color.fromRGBO(99, 177, 165, 1.0),
                    isScrollable: true,
                    tabs: choices.map((Choice spec) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8.0),
                              topRight: Radius.circular(8.0)),
                        ),
                        padding: EdgeInsets.only(bottom: 15.0, top: 10.0),
                        child: Text(
                          spec.title,
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      );
                    }).toList()),
              ),
              preferredSize: Size.fromHeight(50.0),
            ),
            body: TabBarView(
              controller: _tabController,
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                _exterior(),
                _interior(),
                _dimensi(),
                _mesin(),
                _peforma(),
                _safety(),
                _entertaiment()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _mesin() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return StreamBuilder(
      stream: spesifikasiBloc.mesin.stream,
      builder: (context, snapshot){
        if(!snapshot.hasData) return Container();
        var data = json.decode(snapshot.data);
        return Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Tipe Mesin",
                  style: TextStyle(
                      color: Color.fromRGBO(112, 112, 112, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Text(
                  "${data["tipe"]}",
                  style: TextStyle(
                      color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                ),
              ],
            ),
            Divider(color: Color.fromRGBO(204, 235, 230, 1)),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Kapasitas Mesin",
                  style: TextStyle(
                      color: Color.fromRGBO(112, 112, 112, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Text(
                  "${data["kapasitas_mesin"]}",
                  style: TextStyle(
                      color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                ),
              ],
            ),
            Divider(color: Color.fromRGBO(204, 235, 230, 1)),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Kapasitas Tangki",
                  style: TextStyle(
                      color: Color.fromRGBO(112, 112, 112, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Text(
                  "${data["kapasitas_tangki"]}",
                  style: TextStyle(
                      color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                ),
              ],
            ),
            Divider(color: Color.fromRGBO(204, 235, 230, 1)),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Max. Power",
                  style: TextStyle(
                      color: Color.fromRGBO(112, 112, 112, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Text(
                  "${data["max_power"]}",
                  style: TextStyle(
                      color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                ),
              ],
            ),
            Divider(color: Color.fromRGBO(204, 235, 230, 1)),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Max. Torque",
                  style: TextStyle(
                      color: Color.fromRGBO(112, 112, 112, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Text(
                  "${data["max_torque"]}",
                  style: TextStyle(
                      color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                ),
              ],
            ),
            Divider(color: Color.fromRGBO(204, 235, 230, 1)),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Cylinder",
                  style: TextStyle(
                      color: Color.fromRGBO(112, 112, 112, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Text(
                  "${data["cylinder"]}",
                  style: TextStyle(
                      color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                ),
              ],
            ),
            Divider(color: Color.fromRGBO(204, 235, 230, 1)),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Valve per Cylinder",
                  style: TextStyle(
                      color: Color.fromRGBO(112, 112, 112, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Text(
                  "${data["valve_per_cylinder"]}",
                  style: TextStyle(
                      color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                ),
              ],
            ),
            Divider(color: Color.fromRGBO(204, 235, 230, 1)),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Turbo Charger",
                  style: TextStyle(
                      color: Color.fromRGBO(112, 112, 112, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Text(
                  "${data["turbo_charged"]}",
                  style: TextStyle(
                      color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                ),
              ],
            ),
            Divider(color: Color.fromRGBO(204, 235, 230, 1)),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Transmisi",
                  style: TextStyle(
                      color: Color.fromRGBO(112, 112, 112, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Text(
                  "${data["transmisi"]}",
                  style: TextStyle(
                      color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                ),
              ],
            ),
            Divider(color: Color.fromRGBO(204, 235, 230, 1)),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Gearbox",
                  style: TextStyle(
                      color: Color.fromRGBO(112, 112, 112, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Text(
                  "${data["gearbox"]}",
                  style: TextStyle(
                      color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                ),
              ],
            ),
            Divider(color: Color.fromRGBO(204, 235, 230, 1)),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Clutch",
                  style: TextStyle(
                      color: Color.fromRGBO(112, 112, 112, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Text(
                  "${data["clutch"]}",
                  style: TextStyle(
                      color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                ),
              ],
            ),
            Divider(color: Color.fromRGBO(204, 235, 230, 1)),
          ],
        ));
      },

    );
    

  }

  Widget _peforma() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return StreamBuilder(
      stream: spesifikasiBloc.performa.stream,
      builder: (context, snapshot){
        if(!snapshot.hasData) return Container();
        var data = json.decode(snapshot.data);
        return Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Akselerasi 0-100 km/jam",
                  style: TextStyle(
                      color: Color.fromRGBO(112, 112, 112, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Text(
                  "${data["akselerasi"]}",
                  style: TextStyle(
                      color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                ),
              ],
            ),
            Divider(color: Color.fromRGBO(204, 235, 230, 1)),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Top Speed",
                  style: TextStyle(
                      color: Color.fromRGBO(112, 112, 112, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Text(
                  "${data["top_speed"]}",
                  style: TextStyle(
                      color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                ),
              ],
            ),
            Divider(color: Color.fromRGBO(204, 235, 230, 1)),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "1/4 mile",
                  style: TextStyle(
                      color: Color.fromRGBO(112, 112, 112, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Text(
                  "${data["mile"]}",
                  style: TextStyle(
                      color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                ),
              ],
            ),
            Divider(color: Color.fromRGBO(204, 235, 230, 1)),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Braking 100 km/jam",
                  style: TextStyle(
                      color: Color.fromRGBO(112, 112, 112, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Text(
                  "${data["braking"]}",
                  style: TextStyle(
                      color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                ),
              ],
            ),
            Divider(color: Color.fromRGBO(204, 235, 230, 1)),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Tipe Bahan Bakar",
                  style: TextStyle(
                      color: Color.fromRGBO(112, 112, 112, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Text(
                  "${data["tipe_bahan_bakar"]}",
                  style: TextStyle(
                      color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                ),
              ],
            ),
            Divider(color: Color.fromRGBO(204, 235, 230, 1)),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Konsumsi Bahan Bakar",
                  style: TextStyle(
                      color: Color.fromRGBO(112, 112, 112, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Normal",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "${data["konsumsi_bahan_bakar_normal"]}",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Divider(color: Color.fromRGBO(204, 235, 230, 1)),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Tol",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "${data["konsumsi_bahan_bakar_tol"]}",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Divider(color: Color.fromRGBO(204, 235, 230, 1)),
            ),
          ],
        ));
      });
  }

  Widget _dimensi() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return StreamBuilder(
      stream: spesifikasiBloc.dimensi.stream,
      builder: (context, snapshot){
        if(!snapshot.hasData) return Container();
        var data = json.decode(snapshot.data);

        return Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "LxWxH (mm)",
                  style: TextStyle(
                      color: Color.fromRGBO(112, 112, 112, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Text(
                  "${data["lxwxhx"]}",
                  style: TextStyle(
                      color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                ),
              ],
            ),
            Divider(color: Color.fromRGBO(204, 235, 230, 1)),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Ground Clearance (mm)",
                  style: TextStyle(
                      color: Color.fromRGBO(112, 112, 112, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Text(
                  "${data["ground_clearance"]}",
                  style: TextStyle(
                      color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                ),
              ],
            ),
            Divider(color: Color.fromRGBO(204, 235, 230, 1)),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Wheel Base (mm)",
                  style: TextStyle(
                      color: Color.fromRGBO(112, 112, 112, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Text(
                  "${data["wheel_base"]}",
                  style: TextStyle(
                      color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                ),
              ],
            ),
            Divider(color: Color.fromRGBO(204, 235, 230, 1)),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Kapasitas Penumpang",
                  style: TextStyle(
                      color: Color.fromRGBO(112, 112, 112, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Text(
                  "${data["kapasitas_penumpang"]}",
                  style: TextStyle(
                      color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                ),
              ],
            ),
            Divider(color: Color.fromRGBO(204, 235, 230, 1)),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Jumlah Pintu",
                  style: TextStyle(
                      color: Color.fromRGBO(112, 112, 112, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Text(
                  "${data["jumlah_pintu"]}",
                  style: TextStyle(
                      color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                ),
              ],
            ),
            Divider(color: Color.fromRGBO(204, 235, 230, 1)),
          ],
        ));
      }
    );
    
  }

  Widget _exterior() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return StreamBuilder(
      stream: spesifikasiBloc.exterior.stream,
      builder: (context, snapshot){
        if(!snapshot.hasData) return Container();
        var data = json.decode(snapshot.data);
        return Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Warna",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "${data["warna"]}",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                  ),
                ],
              ),
              Divider(color: Color.fromRGBO(204, 235, 230, 1)),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Tipe Cat",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "${data["tipe_cat"]}",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                  ),
                ],
              ),
              Divider(color: Color.fromRGBO(204, 235, 230, 1)),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Spion",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Electric",
                          style: TextStyle(
                              color: Color.fromRGBO(112, 112, 112, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                          data["spion_electric"] == true ? "Yes" : "No",
                          style: TextStyle(
                              color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                        ),
                      ],
                    ),
                    Divider(color: Color.fromRGBO(204, 235, 230, 1)),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Folding",
                          style: TextStyle(
                              color: Color.fromRGBO(112, 112, 112, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                           data["spion_folding"] == true ? "Yes" : "No",
                          style: TextStyle(
                              color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                        ),
                      ],
                    ),
                    Divider(color: Color.fromRGBO(204, 235, 230, 1)),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Lampu Signal",
                          style: TextStyle(
                              color: Color.fromRGBO(112, 112, 112, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                          data["spion_lampu_signal"] == true ? "Yes" : "No",
                          style: TextStyle(
                              color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                        ),
                      ],
                    ),
                    Divider(color: Color.fromRGBO(204, 235, 230, 1)),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Head light",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "${data["head_light"]}",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                  ),
                ],
              ),
              Divider(color: Color.fromRGBO(204, 235, 230, 1)),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Tail Light",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "${data["tail_light"]}",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                  ),
                ],
              ),
              Divider(color: Color.fromRGBO(204, 235, 230, 1)),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Fog Lamp",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "${data["fog_lamp"]}",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                  ),
                ],
              ),
              Divider(color: Color.fromRGBO(204, 235, 230, 1)),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Door Handle",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "${data["door_handle"]}",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                  ),
                ],
              ),
              Divider(color: Color.fromRGBO(204, 235, 230, 1)),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Door Soft Close",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "${data["door_soft_close"]}",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                  ),
                ],
              ),
              Divider(color: Color.fromRGBO(204, 235, 230, 1)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Keyless Entry",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Pintu Penumpang",
                          style: TextStyle(
                              color: Color.fromRGBO(112, 112, 112, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                          data["keyless_entry_pintu_penumpang"] == true ? "Yes" : "No",
                          style: TextStyle(
                              color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                        ),
                      ],
                    ),
                    Divider(color: Color.fromRGBO(204, 235, 230, 1)),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Bagasi",
                          style: TextStyle(
                              color: Color.fromRGBO(112, 112, 112, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                           data["keyless_entry_bagasi"] == true ? "Yes" : "No",
                          style: TextStyle(
                              color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                        ),
                      ],
                    ),
                    Divider(color: Color.fromRGBO(204, 235, 230, 1)),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Parking Sensor",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "${data["parking_sensor"]}",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                  ),
                ],
              ),
              Divider(color: Color.fromRGBO(204, 235, 230, 1)),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Sun Roof",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "${data["sun_roof"]}",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                  ),
                ],
              ),
              Divider(color: Color.fromRGBO(204, 235, 230, 1)),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Bentuk Knalpot",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "${data["bentuk_knalpot"]}",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                  ),
                ],
              ),
              Divider(color: Color.fromRGBO(204, 235, 230, 1)),
            ],
          ),
        ));
      }
    );
    
  }

  Widget _interior() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return StreamBuilder(
      stream: spesifikasiBloc.interior.stream,
      builder: (context, snapshot){
        if(!snapshot.hasData) return Container();
        var data = json.decode(snapshot.data);
        return Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Jok Kulit",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "${data["jok_kulit"]}",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                  ),
                ],
              ),
              Divider(color: Color.fromRGBO(204, 235, 230, 1)),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Power Window",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "${data["power_window"]}",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                  ),
                ],
              ),
              Divider(color: Color.fromRGBO(204, 235, 230, 1)),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Power Bagasi",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "${data["power_bagasi"]}",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                  ),
                ],
              ),
              Divider(color: Color.fromRGBO(204, 235, 230, 1)),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Power Seat",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "${data["power_seat"]}",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                  ),
                ],
              ),
              Divider(color: Color.fromRGBO(204, 235, 230, 1)),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Central Lock",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Driver",
                          style: TextStyle(
                              color: Color.fromRGBO(112, 112, 112, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                          data["central_lock_driver"] == true ? "Yes" : "No",
                          style: TextStyle(
                              color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                        ),
                      ],
                    ),
                    Divider(color: Color.fromRGBO(204, 235, 230, 1)),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Front Passanger",
                          style: TextStyle(
                              color: Color.fromRGBO(112, 112, 112, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                          data["central_lock_front_passanger"] == true ? "Yes" : "No",
                          style: TextStyle(
                              color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                        ),
                      ],
                    ),
                    Divider(color: Color.fromRGBO(204, 235, 230, 1)),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Rear Passanger",
                          style: TextStyle(
                              color: Color.fromRGBO(112, 112, 112, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                           data["central_lock_rear_passanger"] == true ? "Yes" : "No",
                          style: TextStyle(
                              color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                        ),
                      ],
                    ),
                    Divider(color: Color.fromRGBO(204, 235, 230, 1)),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Engine Start/Stop",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "${data["engine_start_stop"]}",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                  ),
                ],
              ),
              Divider(color: Color.fromRGBO(204, 235, 230, 1)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Steering Wheel",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Adjustable",
                          style: TextStyle(
                              color: Color.fromRGBO(112, 112, 112, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                          data["central_lock_adjustable"] == true ? "Yes" : "No",
                          style: TextStyle(
                              color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                        ),
                      ],
                    ),
                    Divider(color: Color.fromRGBO(204, 235, 230, 1)),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Cruise Control",
                          style: TextStyle(
                              color: Color.fromRGBO(112, 112, 112, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                           data["central_lock_cruise_control"] == true ? "Yes" : "No",
                          style: TextStyle(
                              color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                        ),
                      ],
                    ),
                    Divider(color: Color.fromRGBO(204, 235, 230, 1)),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Audio Control",
                          style: TextStyle(
                              color: Color.fromRGBO(112, 112, 112, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                           data["central_lock_audio_control"] == true ? "Yes" : "No",
                          style: TextStyle(
                              color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                        ),
                      ],
                    ),
                    Divider(color: Color.fromRGBO(204, 235, 230, 1)),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Gear Shift Paddle",
                          style: TextStyle(
                              color: Color.fromRGBO(112, 112, 112, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                           data["central_lock_gearshift_paddle"] == true ? "Yes" : "No",
                          style: TextStyle(
                              color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                        ),
                      ],
                    ),
                    Divider(color: Color.fromRGBO(204, 235, 230, 1)),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Digital Dashboard",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "${data["digital_dashboard"]}",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                  ),
                ],
              ),
              Divider(color: Color.fromRGBO(204, 235, 230, 1)),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Heads up Display",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "${data["heads_up_display"]}",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                  ),
                ],
              ),
              Divider(color: Color.fromRGBO(204, 235, 230, 1)),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Touch Screen Display",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Jumlah",
                          style: TextStyle(
                              color: Color.fromRGBO(112, 112, 112, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                          data["touch_screen_display_jumlah"] == true ? "Yes" : "No",
                          style: TextStyle(
                              color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                        ),
                      ],
                    ),
                    Divider(color: Color.fromRGBO(204, 235, 230, 1)),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Ukuran",
                          style: TextStyle(
                              color: Color.fromRGBO(112, 112, 112, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                           data["touch_screen_display_ukuran"] == true ? "Yes" : "No",
                          style: TextStyle(
                              color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                        ),
                      ],
                    ),
                    Divider(color: Color.fromRGBO(204, 235, 230, 1)),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Navigation",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "${data["navigation"]}",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                  ),
                ],
              ),
              Divider(color: Color.fromRGBO(204, 235, 230, 1)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Air Conditioner",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Double Blower",
                          style: TextStyle(
                              color: Color.fromRGBO(112, 112, 112, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                          data["air_conditioner_double_blower"] == true ? "Yes" : "No",
                          style: TextStyle(
                              color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                        ),
                      ],
                    ),
                    Divider(color: Color.fromRGBO(204, 235, 230, 1)),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Touch Screen Control",
                          style: TextStyle(
                              color: Color.fromRGBO(112, 112, 112, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                           data["air_conditioner_touch_screen_control"] == true ? "Yes" : "No",
                          style: TextStyle(
                              color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                        ),
                      ],
                    ),
                    Divider(color: Color.fromRGBO(204, 235, 230, 1)),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Number of Vents",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Front",
                          style: TextStyle(
                              color: Color.fromRGBO(112, 112, 112, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                          data["number_of_vent_front"] == true ? "Yes" : "No",
                          style: TextStyle(
                              color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                        ),
                      ],
                    ),
                    Divider(color: Color.fromRGBO(204, 235, 230, 1)),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Rear",
                          style: TextStyle(
                              color: Color.fromRGBO(112, 112, 112, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                           data["number_of_vent_rear"] == true ? "Yes" : "No",
                          style: TextStyle(
                              color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                        ),
                      ],
                    ),
                    Divider(color: Color.fromRGBO(204, 235, 230, 1)),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Voice Command/Control",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "${data["voice_command_control"]}",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                  ),
                ],
              ),
              Divider(color: Color.fromRGBO(204, 235, 230, 1)),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Rear Passanger TV",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "${data["rear_passanger_tv"]}",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                  ),
                ],
              ),
              Divider(color: Color.fromRGBO(204, 235, 230, 1)),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Rear Passanger Controller",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "${data["rear_passanger_controller"]}",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                  ),
                ],
              ),
              Divider(color: Color.fromRGBO(204, 235, 230, 1)),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Cool Box",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "${data["cool_box"]}",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                  ),
                ],
              ),
              Divider(color: Color.fromRGBO(204, 235, 230, 1)),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Ambient Lighting",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "${data["ambience_lightning"]}",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                  ),
                ],
              ),
              Divider(color: Color.fromRGBO(204, 235, 230, 1)),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Vanity Mirror",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "${data["vanity_mirror"]}",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                  ),
                ],
              ),
              Divider(color: Color.fromRGBO(204, 235, 230, 1)),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Folding Table",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "${data["folding_table"]}",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                  ),
                ],
              ),
              Divider(color: Color.fromRGBO(204, 235, 230, 1)),
            ],
          ),
        ));
      }
    );
    
  }

  Widget _safety() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return StreamBuilder(
      stream: spesifikasiBloc.safety.stream,
      builder: (context, snapshot){
        if(!snapshot.hasData) return Container();
        var data = json.decode(snapshot.data);
        return Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Seatbelts",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "${data["seat_belts"]}",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                  ),
                ],
              ),
              Divider(color: Color.fromRGBO(204, 235, 230, 1)),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Seatbelts Reminder",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "${data["seat_belts_reminder"]}",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                  ),
                ],
              ),
              Divider(color: Color.fromRGBO(204, 235, 230, 1)),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Child Safety Lock",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "${data["child_safety_lock"]}",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                  ),
                ],
              ),
              Divider(color: Color.fromRGBO(204, 235, 230, 1)),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Airbags",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Driver",
                          style: TextStyle(
                              color: Color.fromRGBO(112, 112, 112, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                          data["airbag_driver"] == true ? "Yes" : "No",
                          style: TextStyle(
                              color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                        ),
                      ],
                    ),
                    Divider(color: Color.fromRGBO(204, 235, 230, 1)),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Front Passanger",
                          style: TextStyle(
                              color: Color.fromRGBO(112, 112, 112, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                           data["airbag_front_passanger"] == true ? "Yes" : "No",
                          style: TextStyle(
                              color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                        ),
                      ],
                    ),
                    Divider(color: Color.fromRGBO(204, 235, 230, 1)),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Rear Passanger",
                          style: TextStyle(
                              color: Color.fromRGBO(112, 112, 112, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                          data["airbag_rear_passanger"] == true ? "Yes" : "No",
                          style: TextStyle(
                              color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                        ),
                      ],
                    ),
                    Divider(color: Color.fromRGBO(204, 235, 230, 1)),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "ABS",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "${data["abs"]}",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                  ),
                ],
              ),
              Divider(color: Color.fromRGBO(204, 235, 230, 1)),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Electronic Stability Control",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "${data["electronic_stability_control"]}",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                  ),
                ],
              ),
              Divider(color: Color.fromRGBO(204, 235, 230, 1)),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Automatic Emergency Brake",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "${data["automatic_emergency_brake"]}",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                  ),
                ],
              ),
              Divider(color: Color.fromRGBO(204, 235, 230, 1)),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Rear Cross Trafic Alert",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "${data["rear_cross_traffic_control"]}",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                  ),
                ],
              ),
              Divider(color: Color.fromRGBO(204, 235, 230, 1)),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Adaptive Cruise Control",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "${data["adaptive_cruise_control"]}",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                  ),
                ],
              ),
              Divider(color: Color.fromRGBO(204, 235, 230, 1)),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Forward Collison Warning",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "${data['forward_collision_warning']}",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                  ),
                ],
              ),
              Divider(color: Color.fromRGBO(204, 235, 230, 1)),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Lane Derparture Warning and Assist",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "${data['lane_departure_warning_and_assist']}",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                  ),
                ],
              ),
              
              Divider(color: Color.fromRGBO(204, 235, 230, 1)),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Blind Spot Warning",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "${data['blind_spot_warning']}",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                  ),
                ],
              ),
              Divider(color: Color.fromRGBO(204, 235, 230, 1)),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Autonomous Driving",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "${data['autonomus_driving']}",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                  ),
                ],
              ),
              Divider(color: Color.fromRGBO(204, 235, 230, 1)),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Night Vision",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "${data['night_vision']}",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                  ),
                ],
              ),
              Divider(color: Color.fromRGBO(204, 235, 230, 1)),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Anti Theft  Alarm",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "${data['anti_thef_alarm']}",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                  ),
                ],
              ),
              Divider(color: Color.fromRGBO(204, 235, 230, 1)),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Engine Immobilizer",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                   "${data['engine_immobilizer']}",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                  ),
                ],
              ),
              Divider(color: Color.fromRGBO(204, 235, 230, 1)),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Crash Test Rating",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "${data['crash_test_rating']}",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                  ),
                ],
              ),
              Divider(color: Color.fromRGBO(204, 235, 230, 1)),
              
            ],
          ),
        ));
      }
    );

  }

  Widget _entertaiment() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return StreamBuilder(
      stream: spesifikasiBloc.entertaiment.stream,
      builder: (context, snapshot){
        if(!snapshot.hasData) return Container();
        var data = json.decode(snapshot.data);
        return Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "USB and AUX Input",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "${data["usb_and_aux"]}",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                  ),
                ],
              ),
              Divider(color: Color.fromRGBO(204, 235, 230, 1)),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Bluetooth",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "${data["bluetooth"]}",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                  ),
                ],
              ),
              Divider(color: Color.fromRGBO(204, 235, 230, 1)),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Android Auto",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "${data["android_auto"]}",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                  ),
                ],
              ),
              Divider(color: Color.fromRGBO(204, 235, 230, 1)),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Apple Car Play",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "${data["apple_car_play"]}",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                  ),
                ],
              ),
              Divider(color: Color.fromRGBO(204, 235, 230, 1)),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Speaker",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Brand",
                          style: TextStyle(
                              color: Color.fromRGBO(112, 112, 112, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                          "${data['speaker_brand']}",
                          style: TextStyle(
                              color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                        ),
                      ],
                    ),
                    Divider(color: Color.fromRGBO(204, 235, 230, 1)),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Front Speaker",
                          style: TextStyle(
                              color: Color.fromRGBO(112, 112, 112, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                          "${data['speaker_front']}",
                          style: TextStyle(
                              color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                        ),
                      ],
                    ),
                    Divider(color: Color.fromRGBO(204, 235, 230, 1)),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Rear Speaker",
                          style: TextStyle(
                              color: Color.fromRGBO(112, 112, 112, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                          "${data['speaker_rear']}",
                          style: TextStyle(
                              color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                        ),
                      ],
                    ),
                    Divider(color: Color.fromRGBO(204, 235, 230, 1)),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Radio/CD/DVD",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "${data["radio_cd_dvd"]}",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                  ),
                ],
              ),
              Divider(color: Color.fromRGBO(204, 235, 230, 1)),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Rear TV/Display",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "${data["rear_tv_display"]}",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                  ),
                ],
              ),
              Divider(color: Color.fromRGBO(204, 235, 230, 1)),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Rear Passenger Controller",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "${data["rear_passanger_controller"]}",
                    style: TextStyle(
                        color: Color.fromRGBO(112, 112, 112, 1), fontSize: 20),
                  ),
                ],
              ),
              Divider(color: Color.fromRGBO(204, 235, 230, 1)),
              
            ],
          ),
        ));
      }
    );

  }
}
