import 'package:biodata_app/Models/biodata_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

ValueNotifier<List<BioDataModel>> biodataNotifier = ValueNotifier([]);

abstract class DBFunctionsABS {
  Future<void> addBiodata(BioDataModel value);
  Future<void> getBiodata();
  Future<void> deleteBiodata(int id);
}

class DBFunctions extends DBFunctionsABS {
  @override
  Future<void> addBiodata(BioDataModel data) async {
    final biodataDB = await Hive.openBox<BioDataModel>('biodata_db1');
    final id = await biodataDB.add(data);
    data.id = id;
    biodataNotifier.value.add(data);
    biodataNotifier.notifyListeners();
  }

  @override
  Future<void> getBiodata() async {
    final biodataDB = await Hive.openBox<BioDataModel>('biodata_db1');
    biodataNotifier.value.clear();
    biodataNotifier.value.addAll(biodataDB.values);
    biodataNotifier.notifyListeners();
  }

  @override
  Future<void> deleteBiodata(int id) async {
    final biodataDB = await Hive.openBox<BioDataModel>('biodata_db1');
    biodataDB.delete(id);
  }
}
