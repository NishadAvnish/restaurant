// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveDataModelAdapter extends TypeAdapter<HiveDataModel> {
  @override
  final int typeId = 0;

  @override
  HiveDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveDataModel()
      ..name = fields[0] as String
      ..price = fields[1] as int
      ..id = fields[2] as String
      ..instock = fields[3] as bool;
  }

  @override
  void write(BinaryWriter writer, HiveDataModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.instock);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
