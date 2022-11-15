// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paseadores_local.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PaseadoresLocalAdapter extends TypeAdapter<PaseadoresLocal> {
  @override
  final int typeId = 0;

  @override
  PaseadoresLocal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PaseadoresLocal()
      ..id = fields[0] as String?
      ..nombre = fields[1] as String?
      ..contacto = fields[2] as String?
      ..ciudad = fields[3] as String?
      ..foto = fields[4] as String?
      ..perfil = fields[5] as String?;
  }

  @override
  void write(BinaryWriter writer, PaseadoresLocal obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nombre)
      ..writeByte(2)
      ..write(obj.contacto)
      ..writeByte(3)
      ..write(obj.ciudad)
      ..writeByte(4)
      ..write(obj.foto)
      ..writeByte(5)
      ..write(obj.perfil);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PaseadoresLocalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
