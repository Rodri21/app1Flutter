import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:programa1/models/event_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/post_model.dart';

class DatabaseHelper {
  static final nameDB = 'SOCIALDB';
  static final versionDB = 1;

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    return _database = await _initDatabase();
  }

  _initDatabase() async {
    Directory folder = await getApplicationDocumentsDirectory();
    String pathDB = join(folder.path, nameDB);
    return await openDatabase(
      pathDB,
      version: versionDB,
      onCreate: _createTables,
    );
  }

  _createTables(Database db, int version) async {
    String query = '''CREATE TABLE tblPost( 
      idPost INTEGER PRIMARY KEY, 
      dscPost VARCHAR(200), 
      datePost DATE);''';
    db.execute(query);
    query = '''CREATE TABLE tblEvent(
      idEvento INTEGER PRIMARY KEY,
      dscEvento VARCHAR(200),
      fechaEvento DATE,
      completado INTEGER DEFAULT 0
    );''';
    db.execute(query);
  }

  Future<int> INSERT(String tblName, Map<String, dynamic> data) async {
    var conexion = await database;
    return conexion.insert(tblName, data);
  }

  Future<int> UPDATEPOST(String tblName, Map<String, dynamic> data) async {
    var conexion = await database;
    return conexion.update(tblName, data,
        where: 'idPost = ?', whereArgs: [data['idPost']]);
  }

  Future<int> DELETEPOST(String tblName, int idPost) async {
    var conexion = await database;
    return conexion.delete(tblName, where: 'idPost = ?', whereArgs: [idPost]);
  }

    Future<int> DELETEEVENT(String tblName, int idPost) async {
    var conexion = await database;
    return conexion.delete(tblName, where: 'idEvento = ?', whereArgs: [idPost]);
  }

  Future<List<PostModel>> GETALLPOST() async {
    var conexion = await database;
    var result = await conexion.query('tblPost');
    return result.map((post) => PostModel.fromMap(post)).toList();
  }

  Future<List<EventModel>> GETALLEVENTS() async{
    var conexion = await database;
    var result = await conexion.query('tblEvent');
    return result.map((event) => EventModel.fromMap(event)).toList();
  }
}
