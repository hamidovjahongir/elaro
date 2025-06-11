// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_mode.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CardModeAdapter extends TypeAdapter<CardMode> {
  @override
  final int typeId = 0;

  @override
  CardMode read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CardMode(
      id: fields[0] as int,
      nameUz: fields[1] as String,
      nameCrl: fields[2] as String,
      nameRu: fields[3] as String,
      color: fields[4] as String,
      price: fields[5] as String,
      qty: fields[6] as int,
      discountedPrice: fields[7] as int,
      discount: fields[8] as String,
      discountType: fields[9] as String?,
      discountStart: fields[10] as String?,
      discountEnd: fields[11] as String?,
      descriptionUz: fields[12] as String,
      descriptionCrl: fields[13] as String,
      descriptionRu: fields[14] as String,
      categoryId: fields[15] as int,
      brandId: fields[16] as int,
      images: (fields[17] as List).cast<Rasim>(),
      attributes: (fields[18] as List).cast<Attribute>(),
    );
  }

  @override
  void write(BinaryWriter writer, CardMode obj) {
    writer
      ..writeByte(19)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nameUz)
      ..writeByte(2)
      ..write(obj.nameCrl)
      ..writeByte(3)
      ..write(obj.nameRu)
      ..writeByte(4)
      ..write(obj.color)
      ..writeByte(5)
      ..write(obj.price)
      ..writeByte(6)
      ..write(obj.qty)
      ..writeByte(7)
      ..write(obj.discountedPrice)
      ..writeByte(8)
      ..write(obj.discount)
      ..writeByte(9)
      ..write(obj.discountType)
      ..writeByte(10)
      ..write(obj.discountStart)
      ..writeByte(11)
      ..write(obj.discountEnd)
      ..writeByte(12)
      ..write(obj.descriptionUz)
      ..writeByte(13)
      ..write(obj.descriptionCrl)
      ..writeByte(14)
      ..write(obj.descriptionRu)
      ..writeByte(15)
      ..write(obj.categoryId)
      ..writeByte(16)
      ..write(obj.brandId)
      ..writeByte(17)
      ..write(obj.images)
      ..writeByte(18)
      ..write(obj.attributes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CardModeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AttributeAdapter extends TypeAdapter<Attribute> {
  @override
  final int typeId = 1;

  @override
  Attribute read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Attribute(
      id: fields[0] as int,
      nameUz: fields[1] as String,
      nameCrl: fields[2] as String,
      nameRu: fields[3] as String,
      valueUz: fields[4] as String,
      valueCrl: fields[5] as String,
      valueRu: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Attribute obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nameUz)
      ..writeByte(2)
      ..write(obj.nameCrl)
      ..writeByte(3)
      ..write(obj.nameRu)
      ..writeByte(4)
      ..write(obj.valueUz)
      ..writeByte(5)
      ..write(obj.valueCrl)
      ..writeByte(6)
      ..write(obj.valueRu);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AttributeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RasimAdapter extends TypeAdapter<Rasim> {
  @override
  final int typeId = 2;

  @override
  Rasim read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Rasim(
      id: fields[0] as int,
      image: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Rasim obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RasimAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
