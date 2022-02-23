import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final String clienteTable = "clienteTable";
final String idColumn = "idColumn";
final String nameColumn = "nameColumn";
final String emailColumn = "emailColumn";
final String phoneColumn = "phoneColumn";
final String imgColumn = "imgColumn";

class ClienteHelper {
  static final ClienteHelper _instance = ClienteHelper.internal();

  factory ClienteHelper() => _instance;

  ClienteHelper.internal();

  Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDb();
      return _db;
    }
  }

  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, "Clientesnew.db");

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
      await db.execute(
          "CREATE TABLE $clienteTable($idColumn INTEGER PRIMARY KEY, $nameColumn TEXT, $emailColumn TEXT,"
          "$phoneColumn TEXT, $imgColumn TEXT)");
    });
  }

  Future<Cliente> saveCliente(Cliente Cliente) async {
    Database dbCliente = await db;
    Cliente.id = await dbCliente.insert(clienteTable, Cliente.toMap());
    return Cliente;
  }

  Future<Cliente> getCliente(int id) async {
    Database dbCliente = await db;
    List<Map> maps = await dbCliente.query(clienteTable,
        columns: [idColumn, nameColumn, emailColumn, phoneColumn, imgColumn],
        where: "$idColumn = ?",
        whereArgs: [id]);
    if (maps.length > 0) {
      return Cliente.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> deleteCliente(int id) async {
    Database dbCliente = await db;
    return await dbCliente
        .delete(clienteTable, where: "$idColumn = ?", whereArgs: [id]);
  }

  Future<int> updateCliente(Cliente Cliente) async {
    Database dbCliente = await db;
    return await dbCliente.update(clienteTable, Cliente.toMap(),
        where: "$idColumn = ?", whereArgs: [Cliente.id]);
  }

  Future<List> getAllClientes() async {
    Database dbCliente = await db;
    List listMap = await dbCliente.rawQuery("SELECT * FROM $clienteTable");
    List<Cliente> listCliente = List();
    for (Map m in listMap) {
      listCliente.add(Cliente.fromMap(m));
    }
    return listCliente;
  }

  Future<int> getNumber() async {
    Database dbCliente = await db;
    return Sqflite.firstIntValue(
        await dbCliente.rawQuery("SELECT COUNT(*) FROM $clienteTable"));
  }

  Future close() async {
    Database dbCliente = await db;
    dbCliente.close();
  }
}

class Cliente {
  int id;
  String name;
  String email;
  String phone;
  String img;

  Cliente();

  Cliente.fromMap(Map map) {
    id = map[idColumn];
    name = map[nameColumn];
    email = map[emailColumn];
    phone = map[phoneColumn];
    img = map[imgColumn];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      nameColumn: name,
      emailColumn: email,
      phoneColumn: phone,
      imgColumn: img
    };
    if (id != null) {
      map[idColumn] = id;
    }
    return map;
  }

  @override
  String toString() {
    return "Cliente(id: $id, name: $name, email: $email, phone: $phone, img: $img)";
  }
}
