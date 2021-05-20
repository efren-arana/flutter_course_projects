import 'dart:async';
import 'package:qr_map_sqlite/src/bloc/validator.dart';
import 'package:qr_map_sqlite/src/providers/db_provider.dart';

class ScansBloc with Validators {
  static final ScansBloc _singleton = new ScansBloc._internal();
  
  final _scansStreamController = StreamController<List<ScanModel>>.broadcast();

  Stream<List<ScanModel>> get scansStream =>
      _scansStreamController.stream.transform(validarGeo);
  Stream<List<ScanModel>> get scansStreamHttp =>
      _scansStreamController.stream.transform(validarHttp);

  factory ScansBloc() {
    return _singleton;
  }

  void dispose() {
    _scansStreamController?.close();
  }

  ScansBloc._internal() {
    //Obtener los scans de la base de datos
    obtenerScans();
  }

  borrarScan(int id) async {
    await DBProvider.db.deleteScan(id);
    obtenerScans();
  }

  borrarAllScans() async {
    await DBProvider.db.deleteAllScan();
    obtenerScans();
  }

  obtenerScans() async {
    _scansStreamController.sink.add(await DBProvider.db.getAllScans());
    print('obtenerScans()!!!');
  }

  agregarScan(ScanModel nuevoScan) async {
    await DBProvider.db.nuevoScan(nuevoScan);
    obtenerScans();
  }
}
