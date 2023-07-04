import 'package:biodata_app/Models/biodata_model.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

ValueNotifier<List<BioDataModel>> biodataNotifier = ValueNotifier([]);

abstract class DBFunctionsABS {
  Future<void> initializeDataBase();
  Future<void> addBiodata(BioDataModel value);
  Future<void> getBiodata();
  Future<void> deleteBiodata(int id);
  Future<void> updateBiodata(BioDataModel dataModel);
  BioDataModel? getBiodatabyID(int id);
}

class DBFunctions extends DBFunctionsABS {
  late Database _db;
  @override
  Future<void> initializeDataBase() async {
    _db = await openDatabase(
      'biodataApp.db',
      version: 1,
      onCreate: (Database database, version) async {
        await database.execute(
            'CREATE TABLE biodata (id INTEGER PRIMARY KEY, name TEXT, age TEXT, place TEXT, content TEXT)');
      },
    );
  }

  DBFunctions._internal();
  static DBFunctions instance = DBFunctions._internal();
  factory() {
    return instance;
  }

  @override
  Future<void> addBiodata(BioDataModel data) async {
    _db.rawInsert(
        'INSERT INTO biodata (name,age,place,content) VALUES(?,?,?,?)',
        [data.name, data.age, data.place, data.content]);
    getBiodata();
    // biodataNotifier.value.add(data);
    // biodataNotifier.notifyListeners();
  }

  @override
  Future<void> getBiodata() async {
    // final biodataDB = await Hive.openBox<BioDataModel>('biodata_db4');

    final value = await _db.rawQuery('SELECT * FROM biodata');
    biodataNotifier.value.clear();
    print(value);
    value.forEach(
      (element) {
        final data = BioDataModel.fromMap(element);
        biodataNotifier.value.add(data);

        biodataNotifier.notifyListeners();
      },
    );
  }

  @override
  Future<void> deleteBiodata(int id) async {
    //  final biodataDB = await Hive.openBox<BioDataModel>('biodata_db4');
    //  biodataDB.delete(id);
    await _db.rawDelete('DELETE FROM biodata WHERE id = ?', [id]);
    biodataNotifier.value.removeWhere((element) => element.id == id);
    biodataNotifier.notifyListeners();
  }

  @override
  Future<void> updateBiodata(BioDataModel data) async {
    // final biodataDB = await Hive.openBox<BioDataModel>('biodata_db4');

//    await biodataDB.put(data.id, data);

    await _db.rawUpdate(
        'UPDATE biodata SET name = ?, age = ?, place = ?, content = ? WHERE id = ?',
        [data.name, data.age, data.place, data.content, data.id]);

    final index =
        biodataNotifier.value.indexWhere((biodata) => biodata.id == data.id);
    print(index);
    biodataNotifier.value.removeAt(index);
    biodataNotifier.value.insert(index, data);
    biodataNotifier.notifyListeners();
  }

  @override
  BioDataModel? getBiodatabyID(int id) {
    try {
      // print(biodataNotifier.value.firstWhere((biodata) => biodata.id == id));
      return biodataNotifier.value.firstWhere((biodata) => biodata.id == id);
    } catch (_) {
      print(biodataNotifier.value.firstWhere((biodata) => biodata.id == id));
      return null;
    }
  }
}
