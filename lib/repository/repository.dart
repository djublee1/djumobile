import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:djublee/conts/conts.dart';

class Repository {
  static String mainUrl = baseUrl + "api";
  static String _getMobils = mainUrl + "/mobils";
  static String _getMobil = mainUrl + "/mobil/";
  static String _getMesin = mainUrl + "/mesin/";
  static String _getPerforma = mainUrl + "/performa/";
  static String _getDimensi = mainUrl + "/dimensi/";
  static String _getExterior = mainUrl + "/eksterior/";
  static String _getInterior = mainUrl + "/interior/";
  static String _getSafety = mainUrl + "/safety/";
  static String _getEntertaiment = mainUrl + "/entertaiment/";
  static String _getEksteriorPhoto = mainUrl + "/eksteriorphoto/";
  static String _getInteriorPhoto = mainUrl + "/interiorphoto/";
  static String _getDimensiPhoto = mainUrl + "/dimensiphoto/";
  static String _getMesinPhoto = mainUrl + "/mesinphoto/";
  static String _getPerformaPhoto = mainUrl + "/performaphoto/";
  static String _getSafetyPhoto = mainUrl + "/safetyphoto/";
  static String _getEntertaimentPhoto = mainUrl + "/entertaimentphoto/";
  static String _getBerita = mainUrl + "/berita/";
  static String _getVideo = mainUrl + "/video/";

  Future<dynamic> getMobil() async{
    try {
      Response response = await Dio().get(_getMobils);
      if(response.statusCode == 200){
        var data = response.data;
        return json.encode(data);;
      }else{
        print("Error status code");
      }
    } catch (e) {
       print("Error status code");
    }
  }

  Future<dynamic> getMobilSingle(id) async{
    var param = {
      "id" : id
    };
    try {
      Response response = await Dio().get(_getMobil + id);
      if(response.statusCode == 200){
        var data = response.data;
        return json.encode(data);;
      }else{
        print("Error status code");
      }
    } catch (e) {
       print("Error status code");
    }
  }

  Future<dynamic> getMesin(id) async{
    var param = {
      "id" : id
    };
    try {
      Response response = await Dio().get(_getMesin + id);
      if(response.statusCode == 200){
        var data = response.data;
        return json.encode(data);;
      }else{
        print("Error status code");
      }
    } catch (e) {
       print("Error status code");
    }
  }

  Future<dynamic> getPerforma(id) async{
    var param = {
      "id" : id
    };
    try {
      Response response = await Dio().get(_getPerforma + id);
      if(response.statusCode == 200){
        var data = response.data;
        return json.encode(data);;
      }else{
        print("Error status code");
      }
    } catch (e) {
       print("Error status code");
    }
  }

  Future<dynamic> getDimensi(id) async{
    var param = {
      "id" : id
    };
    try {
      Response response = await Dio().get(_getDimensi + id);
      if(response.statusCode == 200){
        var data = response.data;
        return json.encode(data);;
      }else{
        print("Error status code");
      }
    } catch (e) {
       print("Error status code");
    }
  }

  Future<dynamic> getExterior(id) async{
    var param = {
      "id" : id
    };
    try {
      Response response = await Dio().get(_getExterior + id);
      if(response.statusCode == 200){
        var data = response.data;
        return json.encode(data);
      }else{
        print("Error status code");
      }
    } catch (e) {
       print("Error status code");
    }
  }

  Future<dynamic> getInterior(id) async{
    var param = {
      "id" : id
    };
    try {
      Response response = await Dio().get(_getInterior + id);
      if(response.statusCode == 200){
        var data = response.data;
        return json.encode(data);
      }else{
        print("Error status code");
      }
    } catch (e) {
       print("Error status code");
    }
  }

  Future<dynamic> getSafety(id) async{
    var param = {
      "id" : id
    };
    try {
      Response response = await Dio().get(_getSafety + id);
      if(response.statusCode == 200){
        var data = response.data;
        return json.encode(data);
      }else{
        print("Error status code");
      }
    } catch (e) {
       print("Error status code");
    }
  }

  Future<dynamic> getEntertaiment(id) async{
    var param = {
      "id" : id
    };
    try {
      Response response = await Dio().get(_getEntertaiment + id);
      if(response.statusCode == 200){
        var data = response.data;
        return json.encode(data);
      }else{
        print("Error status code");
      }
    } catch (e) {
       print("Error status code");
    }
  }

  Future<dynamic> getEksteriorPhotos(id) async{
    var param = {
      "id" : id
    };
    try {
      Response response = await Dio().get(_getEksteriorPhoto + id);
      if(response.statusCode == 200){
        var data = response.data;
        return json.encode(data);
      }else{
        print("Error status code");
      }
    } catch (e) {
       print("Error status code");
    }
  }

  Future<dynamic> getInteriorPhotos(id) async{
    var param = {
      "id" : id
    };
    try {
      Response response = await Dio().get(_getInteriorPhoto + id);
      if(response.statusCode == 200){
        var data = response.data;
        return json.encode(data);
      }else{
        print("Error status code");
      }
    } catch (e) {
       print("Error status code");
    }
  }

  Future<dynamic> getDimensiPhotos(id) async{
    var param = {
      "id" : id
    };
    try {
      Response response = await Dio().get(_getDimensiPhoto + id);
      if(response.statusCode == 200){
        var data = response.data;
        return json.encode(data);
      }else{
        print("Error status code");
      }
    } catch (e) {
       print("Error status code");
    }
  }

  Future<dynamic> getMesinPhotos(id) async{
    var param = {
      "id" : id
    };
    try {
      Response response = await Dio().get(_getMesinPhoto + id);
      if(response.statusCode == 200){
        var data = response.data;
        return json.encode(data);
      }else{
        print("Error status code");
      }
    } catch (e) {
       print("Error status code");
    }
  }

  Future<dynamic> getPerformaPhotos(id) async{
    var param = {
      "id" : id
    };
    try {
      Response response = await Dio().get(_getPerformaPhoto + id);
      if(response.statusCode == 200){
        var data = response.data;
        return json.encode(data);
      }else{
        print("Error status code");
      }
    } catch (e) {
       print("Error status code");
    }
  }

  Future<dynamic> getSafetyPhotos(id) async{
    var param = {
      "id" : id
    };
    try {
      Response response = await Dio().get(_getSafetyPhoto + id);
      if(response.statusCode == 200){
        var data = response.data;
        return json.encode(data);
      }else{
        print("Error status code");
      }
    } catch (e) {
       print("Error status code");
    }
  }

  Future<dynamic> getEntertaimentPhotos(id) async{
    var param = {
      "id" : id
    };
    try {
      Response response = await Dio().get(_getEntertaimentPhoto + id);
      if(response.statusCode == 200){
        var data = response.data;
        return json.encode(data);
      }else{
        print("Error status code");
      }
    } catch (e) {
       print("Error status code");
    }
  }

  Future<dynamic> getBerita(id) async{
    var param = {
      "id" : id
    };
    try {
      Response response = await Dio().get(_getBerita + id);
      if(response.statusCode == 200){
        var data = response.data;
        return json.encode(data);
      }else{
        print("Error status code");
      }
    } catch (e) {
       print("Error status code");
    }
  }

  Future<dynamic> getVideo(id) async{
    var param = {
      "id" : id
    };
    try {
      Response response = await Dio().get(_getVideo + id);
      if(response.statusCode == 200){
        var data = response.data;
        return json.encode(data);
      }else{
        print("Error status code");
      }
    } catch (e) {
       print("Error status code");
    }
  }
}