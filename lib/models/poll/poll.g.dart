// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poll.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PollAdapter extends TypeAdapter<Poll> {
  @override
  final int typeId = 0;

  @override
  Poll read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Poll(
      id: fields[0] as String,
      question: fields[1] as String,
      options: (fields[2] as List).cast<PollOption>(),
      createdAt: fields[3] as DateTime,
      expiryDate: fields[4] as DateTime?,
      votedUsers: (fields[5] as List).cast<String>(),
      likes: (fields[6] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Poll obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.question)
      ..writeByte(2)
      ..write(obj.options)
      ..writeByte(3)
      ..write(obj.createdAt)
      ..writeByte(4)
      ..write(obj.expiryDate)
      ..writeByte(5)
      ..write(obj.votedUsers)
      ..writeByte(6)
      ..write(obj.likes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PollAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PollOptionAdapter extends TypeAdapter<PollOption> {
  @override
  final int typeId = 1;

  @override
  PollOption read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PollOption(
      id: fields[0] as String,
      text: fields[1] as String,
      votes: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, PollOption obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.text)
      ..writeByte(2)
      ..write(obj.votes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PollOptionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
