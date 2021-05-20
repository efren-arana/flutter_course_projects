import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:qr_map_sqlite/src/models/scan_model.dart';
export 'package:qr_map_sqlite/src/models/scan_model.dart';

class DBProvider {
  static Database _database;

  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();

    final path = join(directory.path, 'ScansDB.db');

    //inicializacion de la base de datos
    return await openDatabase(path,
        version:
            1, //cambiar la version de la base de datos si se realizan cambio en el modelo
        onOpen: (db) {}, onCreate: (db, version) async {
      await db.execute('CREATE TABLE SCANS('
          'id    INTEGER PRIMARY KEY,'
          'tipo  TEXT,'
          'valor TEXT'
          ')');
    });
  }

  /// Crear Registros

  nuevoScanRaw(ScanModel nuevoScan) async {
    final db = await database;

    final result = await db.rawInsert("INSERT INTO SCANS (id, tipo, valor) "
        "VALUES (${nuevoScan.id},'${nuevoScan.tipo}', '${nuevoScan.valor}')");

    return result;
  }

  /// Insert registro
  nuevoScan(ScanModel nuevoScan) async {
    final db = await database;

    final result = await db.insert('SCANS', nuevoScan.toJson());

    return result;
  }

  /// SELECT - Obtener informacion por id
  Future<ScanModel> getScanId(int id) async {
    final db = await database;

    final result = await db.query('SCANS', where: 'id = ?', whereArgs: [id]);

    return result.isNotEmpty ? ScanModel.fromJson(result.first) : null;
  }

  /// SELECT - all los scans
  Future<List<ScanModel>> getAllScans() async {
    final db = await database;

    final result = await db.query('SCANS');

    List<ScanModel> list = result.isNotEmpty
        ? result.map((e) => ScanModel.fromJson(e)).toList()
        : [];
    return list;
  }

  /// SELECT por tipo (http,geo)
  Future<List<ScanModel>> getScansPorTipo(String tipo) async {
    final db = await database;

    final result =
        await db.rawQuery("SELECT * FROM SCANS WHERE tipo = '$tipo'");

    List<ScanModel> list = result.isNotEmpty
        ? result.map((e) => ScanModel.fromJson(e)).toList()
        : [];
    return list;
  }

  /// Actualiza registros en las tablas

  Future<int> updateScan(ScanModel nuevoScan) async {
    final db = await database;

    final result = await db.update('SCANS', nuevoScan.toJson(),
        where: 'id = ?', whereArgs: [nuevoScan.id]);

    return result;
  }

  /// Eliminar registros
  Future<int> deleteScan(int id) async {
    final db = await database;

    final result = db.delete('SCANS', where: 'id = ?', whereArgs: [id]);

    return result;
  }

  /**
   * Elimino todos los registros de scans
   */
  Future<int> deleteAllScan() async {
    final db = await database;

    final result = db.rawDelete('DELETE FROM SCANS');

    return result;
  }
}
