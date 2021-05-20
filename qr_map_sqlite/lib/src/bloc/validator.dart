import 'dart:async';

import 'package:qr_map_sqlite/src/models/scan_model.dart';

class Validators {
  final validarGeo =
      StreamTransformer<List<ScanModel>, List<ScanModel>>.fromHandlers(
          handleData: (scans, eventSink) {
    final geoScans = scans.where((element) => element.tipo == 'geo').toList();
    eventSink.add(geoScans);
  });

  final validarHttp =
      StreamTransformer<List<ScanModel>, List<ScanModel>>.fromHandlers(
          handleData: (scans, eventSink) {
    final httpScans = scans.where((element) => element.tipo == 'web').toList();
    eventSink.add(httpScans);
  });
}
