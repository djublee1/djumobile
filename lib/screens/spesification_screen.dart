import 'dart:convert';

import 'package:djublee/bloc/spesifikasi_bloc.dart';
import 'package:djublee/conts/conts.dart';
import 'package:djublee/screens/spesification_list_screen.dart';
import 'package:djublee/screens/video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class SpesificationScreen extends StatefulWidget {
  SpesificationScreen({Key key, @required this.id}) : super(key: key);
  final String id;

  @override
  _SpesificationScreenState createState() => _SpesificationScreenState();
}

class _SpesificationScreenState extends State<SpesificationScreen> {
  int year = 2020;
  Stream streamSpec = spesifikasiBloc.eksteriorPhoto.stream;
  String title = "";

  @override
  void initState() {
    // TODO: implement initState
    spesifikasiBloc..getMobil();
    spesifikasiBloc..getMobilSingle(widget.id);
    spesifikasiBloc..getMesin(widget.id);
    spesifikasiBloc..getPerforma(widget.id);
    spesifikasiBloc..getDimensi(widget.id);
    spesifikasiBloc..getExterior(widget.id);
    spesifikasiBloc..getEksteriorPhotos(widget.id);
    spesifikasiBloc..getInteriorPhotos(widget.id);
    spesifikasiBloc..getDimensiPhotos(widget.id);
    spesifikasiBloc..getMesinPhotos(widget.id);
    spesifikasiBloc..getPerformaPhotos(widget.id);
    spesifikasiBloc..getSafetyPhotos(widget.id);
    spesifikasiBloc..getEntertaimentPhotos(widget.id);
    spesifikasiBloc..getBerita(widget.id);
    spesifikasiBloc..getVideo(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Color.fromRGBO(58, 61, 80, 1), //change your color here
          ),
          title: Center(
              child: Padding(
            padding: const EdgeInsets.only(right: 60),
            child: Text(
              "SPESIFIKASI",
              style: TextStyle(
                  color: Color.fromRGBO(58, 61, 80, 1),
                  fontWeight: FontWeight.bold),
            ),
          )),
          backgroundColor: Color.fromRGBO(209, 214, 22, 1),
          elevation: 2.0,
        ),
        body: ListView(
          children: <Widget>[
            _title(),
            _pictureMobil(),
            _spesifikasi(),
            _beritaterkait(),
            _video(),
          ],
        ));
  }

  Widget _title() {
    return StreamBuilder(
      stream: spesifikasiBloc.mobilSingle.stream,
      builder: (context, snapshot){
        if(!snapshot.hasData) return Container();
        var data = json.decode(snapshot.data);
        title = "${data["merk"]}" + " ${data["group_model"]}" + " ${data["model"]}";
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "${data["merk"]}" + " ${data["group_model"]}" + " ${data["model"]}",
                  style: TextStyle(
                      color: Color.fromRGBO(84, 84, 84, 1.0),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          setState(() {
                            year--;
                          });
                        },
                        child: Icon(
                          Icons.arrow_back_ios_rounded,
                          size: 15,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${data["tahun"]}",
                          style: TextStyle(),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            year++;
                          });
                        },
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 15,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
    
  }

  void changePhotoByTab(String tab){
    if(tab == "Eksterior"){
      setState(() {
        streamSpec = spesifikasiBloc.eksteriorPhoto.stream;
      });
    }else if(tab == "Interior"){
      setState(() {
        streamSpec = spesifikasiBloc.interiorPhoto.stream;
      });
    }else if(tab == "Dimensi"){
      setState(() {
        streamSpec = spesifikasiBloc.dimensiPhoto.stream;
      });
    }else if(tab == "Mesin"){
      setState(() {
        streamSpec = spesifikasiBloc.mesinPhoto.stream;
      });
    }else if(tab == "Performa"){
      setState(() {
        streamSpec = spesifikasiBloc.performaPhoto.stream;
      });
    }else if(tab == "Safety"){
      setState(() {
        streamSpec = spesifikasiBloc.safetyPhoto.stream;
      });
    }else if(tab == "Entertaiment"){
      setState(() {
        streamSpec = spesifikasiBloc.entertaimentPhoto.stream;
      });
    }
    
  }

  Widget _pictureMobil() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return StreamBuilder<Object>(
      stream: streamSpec,
      builder: (context, snapshot) {
        if(!snapshot.hasData) return Container();
        var data = json.decode(snapshot.data);
        return Container(
          height: 228,
          child: PageIndicatorContainer(
            length: data.length,
            align: IndicatorAlign.bottom,
            indicatorSpace: 3.0,
            indicatorColor: Color.fromRGBO(220, 219, 219, 1.0),
            indicatorSelectorColor: Color.fromRGBO(19, 152, 127, 1.0),
            shape: IndicatorShape.circle(size: 5.0),
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 220,
                  child: Image.network(
                    baseUrl + "uploads/${data[index]['file_name']}",
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
        );
      }
    );
  }

  Widget _spesifikasi() {
    return SpesificationListScreen(choices: choices, id: widget.id, functionChangePhoto: changePhotoByTab,);
  }

  Widget _beritaterkait() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return StreamBuilder<Object>(
      stream: spesifikasiBloc.berita.stream,
      builder: (context, snapshot) {
        if(!snapshot.hasData) return Container();
        var data = json.decode(snapshot.data);
        return InkWell(
              onTap: () async{
                String url = "${data['link']}";
                if (await canLaunch(url))
                  await launch(url);
                else 
                  throw "Could not launch $url";
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                      "BERITA TERKAIT", 
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                         color: Color.fromRGBO(112, 112, 112, 1)
                      ),),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: height * 0.3,
                        width: width * 1.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: height * 0.2,
                                  width: width * 0.5,
                                  child: Image.network("${data['file_name']}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: width * 0.5,
                                  child: Text(
                                    "${data['headline']}", 
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromRGBO(112, 112, 112, 1),
                                      fontWeight: FontWeight.w900,
                                    ),
                                    overflow: TextOverflow.clip,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
              ),
        );
      }
    );
  }

  Widget _video() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return StreamBuilder<Object>(
      stream: spesifikasiBloc.video.stream,
      builder: (context, snapshot) {
        if(!snapshot.hasData) return Container();
        var data = json.decode(snapshot.data);
        return Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                    "VIDEO", 
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                       color: Color.fromRGBO(112, 112, 112, 1)
                    ),),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () async{
                        if(data['link_video'] != null && data['link_video'] != ""){
                           String url = "${data['link_video']}";
                          if (await canLaunch(url))
                            await launch(url);
                          else 
                            throw "Could not launch $url";
                        }else{
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VideoPlayerScreen(url: "${data['file_name']}", title: title,)),
                          );
                        }
                        
                      },
                      child: Container(
                        height: height * 0.3,
                        width: width * 1.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: height * 0.2,
                                  width: width * 0.5,
                                  child: Image.network(
                                    baseUrl + "uploads/16092536221_mk1-6aYaf_Bes1E3Imhc0A.jpeg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: width * 0.5,
                                  child: Text(
                                    "${data['headline_video']}", 
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromRGBO(112, 112, 112, 1),
                                      fontWeight: FontWeight.w900,
                                    ),
                                    overflow: TextOverflow.clip,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
            );
      }
    );
  }

  
}
