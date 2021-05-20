import 'package:qr_map_sqlite/src/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

launchURL(BuildContext context, ScanModel scan) async {
  if (scan.tipo == 'web') {
    var url = scan.valor;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  } else {
    Navigator.pushNamed(context, 'mapa', arguments: scan);
  }
}
