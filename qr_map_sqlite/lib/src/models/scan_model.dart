import 'dart:convert';
import 'package:latlong/latlong.dart';

ScanModel scanModelFromJson(String str) => ScanModel.fromJson(json.decode(str));

String scanModelToJson(ScanModel data) => json.encode(data.toJson());

class ScanModel {
  ScanModel({
    this.id,
    this.tipo,
    this.valor,
  }) {
    if (this.valor.contains('http')) {
      this.tipo = 'web';
    } else {
      this.tipo = 'geo';
    }
  }

  int id;
  String tipo;
  String valor;

  factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        tipo: json["tipo"],
        valor: json["valor"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tipo": tipo,
        "valor": valor,
      };

  LatLng getLtdLng() {
    //geo:40.63987808730795,-74.2023219152344
    final split = this.valor.substring(4).split(',');

    final latidud = double.parse(split[0]);
    final longitud = double.parse(split[1]);

    return LatLng(latidud, longitud);
  }
}
