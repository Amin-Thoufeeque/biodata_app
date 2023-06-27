// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'biodata_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BioDataModelAdapter extends TypeAdapter<BioDataModel> {
  @override
  final int typeId = 0;

  @override
  BioDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BioDataModel(
      name: fields[1] as String,
      age: fields[2] as String,
      place: fields[3] as String,
      content: fields[4] as String,
    )..id = fields[0] as int?;
  }

  @override
  void write(BinaryWriter writer, BioDataModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.age)
      ..writeByte(3)
      ..write(obj.place)
      ..writeByte(4)
      ..write(obj.content);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BioDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
