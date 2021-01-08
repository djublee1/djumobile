import 'package:djublee/repository/repository.dart';
import 'package:rxdart/subjects.dart';

class SpesifikasiBloc {
  final Repository _repository = Repository();
  final BehaviorSubject<dynamic> _mobil = BehaviorSubject<dynamic>();
  final BehaviorSubject<dynamic> _mobilSingle = BehaviorSubject<dynamic>();
  final BehaviorSubject<dynamic> _mesin = BehaviorSubject<dynamic>();
  final BehaviorSubject<dynamic> _performa = BehaviorSubject<dynamic>();
  final BehaviorSubject<dynamic> _dimensi = BehaviorSubject<dynamic>();
  final BehaviorSubject<dynamic> _eksterior = BehaviorSubject<dynamic>();
  final BehaviorSubject<dynamic> _interior = BehaviorSubject<dynamic>();
  final BehaviorSubject<dynamic> _safety = BehaviorSubject<dynamic>();
  final BehaviorSubject<dynamic> _entertaiment = BehaviorSubject<dynamic>();

  final BehaviorSubject<dynamic> _eksteriorPhoto = BehaviorSubject<dynamic>();
  final BehaviorSubject<dynamic> _interiorPhoto = BehaviorSubject<dynamic>();
  final BehaviorSubject<dynamic> _dimensiPhoto = BehaviorSubject<dynamic>();
  final BehaviorSubject<dynamic> _mesinPhoto = BehaviorSubject<dynamic>();
  final BehaviorSubject<dynamic> _performaPhoto = BehaviorSubject<dynamic>();
  final BehaviorSubject<dynamic> _safetyPhoto = BehaviorSubject<dynamic>();
  final BehaviorSubject<dynamic> _entertaimentPhoto = BehaviorSubject<dynamic>();

  final BehaviorSubject<dynamic> _berita = BehaviorSubject<dynamic>();
  final BehaviorSubject<dynamic> _video = BehaviorSubject<dynamic>();


  getMobil() async {
    dynamic response = await _repository.getMobil();
    _mobil.sink.add(response);
  }

  getMobilSingle(String id) async {
    dynamic response = await _repository.getMobilSingle(id);
    _mobilSingle.sink.add(response);
  }

  getMesin(String id) async {
    dynamic response = await _repository.getMesin(id);
    _mesin.sink.add(response);
  }
  
  getPerforma(String id) async {
    dynamic response = await _repository.getPerforma(id);
    _performa.sink.add(response);
  }

  getDimensi(String id) async {
    dynamic response = await _repository.getDimensi(id);
    _dimensi.sink.add(response);
  }

  getExterior(String id) async {
    dynamic response = await _repository.getExterior(id);
    _eksterior.sink.add(response);
  }

  getInterior(String id) async {
    dynamic response = await _repository.getInterior(id);
    _interior.sink.add(response);
  }

  getSafety(String id) async {
    dynamic response = await _repository.getSafety(id);
    _safety.sink.add(response);
  }

  getEntertaiment(String id) async {
    dynamic response = await _repository.getEntertaiment(id);
    _entertaiment.sink.add(response);
  }

  getEksteriorPhotos(String id) async {
    dynamic response = await _repository.getEksteriorPhotos(id);
    _eksteriorPhoto.sink.add(response);
  }

  getInteriorPhotos(String id) async {
    dynamic response = await _repository.getInteriorPhotos(id);
    _interiorPhoto.sink.add(response);
  }

  getDimensiPhotos(String id) async {
    dynamic response = await _repository.getDimensiPhotos(id);
    _dimensiPhoto.sink.add(response);
  }

  getMesinPhotos(String id) async {
    dynamic response = await _repository.getMesinPhotos(id);
    _mesinPhoto.sink.add(response);
  }

  getPerformaPhotos(String id) async {
    dynamic response = await _repository.getPerformaPhotos(id);
    _performaPhoto.sink.add(response);
  }

  getSafetyPhotos(String id) async {
    dynamic response = await _repository.getSafetyPhotos(id);
    _safetyPhoto.sink.add(response);
  }

  getEntertaimentPhotos(String id) async {
    dynamic response = await _repository.getEntertaimentPhotos(id);
    _entertaimentPhoto.sink.add(response);
  }

  getBerita(String id) async {
    dynamic response = await _repository.getBerita(id);
    _berita.sink.add(response);
  }

  getVideo(String id) async {
    dynamic response = await _repository.getVideo(id);
    _video.sink.add(response);
  }
  
  dispose(){
    _berita.close();
    _video.close();
    _safety.close();
    _entertaiment.close();
    _mobil.close();
    _mobilSingle.close();
    _mesin.close();
    _performa.close();
    _dimensi.close();
    _eksterior.close();
    _interior.close();
    _eksteriorPhoto.close();
    _interiorPhoto.close();
    _dimensiPhoto.close();
    _mesinPhoto.close();
    _performaPhoto.close();
    _safetyPhoto.close();
    _entertaimentPhoto.close();
  }

  BehaviorSubject<dynamic> get mobil => _mobil;
  BehaviorSubject<dynamic> get mobilSingle => _mobilSingle;
  BehaviorSubject<dynamic> get mesin => _mesin;
  BehaviorSubject<dynamic> get performa => _performa;
  BehaviorSubject<dynamic> get dimensi => _dimensi;
  BehaviorSubject<dynamic> get exterior => _eksterior;
  BehaviorSubject<dynamic> get interior => _interior;
  BehaviorSubject<dynamic> get safety => _safety;
  BehaviorSubject<dynamic> get entertaiment => _entertaiment;
  BehaviorSubject<dynamic> get eksteriorPhoto => _eksteriorPhoto;
  BehaviorSubject<dynamic> get interiorPhoto => _interiorPhoto;
  BehaviorSubject<dynamic> get dimensiPhoto => _dimensiPhoto;
  BehaviorSubject<dynamic> get mesinPhoto => _mesinPhoto;
  BehaviorSubject<dynamic> get performaPhoto => _performaPhoto;
  BehaviorSubject<dynamic> get safetyPhoto => _safetyPhoto;
  BehaviorSubject<dynamic> get entertaimentPhoto => _entertaimentPhoto;
  BehaviorSubject<dynamic> get berita => _berita;
  BehaviorSubject<dynamic> get video => _video;
}

final spesifikasiBloc = SpesifikasiBloc();