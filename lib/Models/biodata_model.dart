import 'package:hive/hive.dart';
part 'biodata_model.g.dart';

@HiveType(typeId: 0)
class BioDataModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String age;
  @HiveField(3)
  final String place;
  @HiveField(4)
  final String content;

  BioDataModel(
      {required this.name,
      required this.age,
      this.id,
      required this.place,
      required this.content});
}
