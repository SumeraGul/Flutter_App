import 'dart:developer';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  static Database? _database;

  static final DataBaseHelper instance = DataBaseHelper._internal();

  DataBaseHelper._internal();
  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await initDb();
    return _database;
  }

  Future<Database> initDb() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath,'my_database.db');
    log('Path: $path', name: 'database');
    return await openDatabase(path, version: 1,onCreate: (db, version) async {
      await db.execute('''
          CREATE TABLE users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            email TEXT NOT NULL
          )
        ''');
    },
    );
  }
  Future<int?> insertData(String name,String email)async{
    final db = await database ;
    return await db?.insert('users', {'name': name,
      'email': email,});

  }



}



