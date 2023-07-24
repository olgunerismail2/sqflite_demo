import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract class DbHelper{

  late Database _db;
  Future<Database> get db async {
    if (_db==null){
      _db= await intializeDb();
  }
    return _db;
}

  Future<Database> intializeDb() async{
    String dbPath = join (await getDatabasesPath(),"etrade.db");
    var eTradeDb= await openDatabase(dbPath,version: 1,onCreate: createDb);
    return eTradeDb;
  }

  void createDb(Database db, int version) async {
    await db.execute("Create Table products(id integer primary key,name text, description text,unitPrice integer)");
  }
}