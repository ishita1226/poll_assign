import 'package:hive/hive.dart';

part 'comment.g.dart';

@HiveType(typeId: 2)
class Comment {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String pollId;

  @HiveField(2)
  final String text;

  @HiveField(3)
  final DateTime createdAt;

  Comment({
    required this.id,
    required this.pollId,
    required this.text,
    required this.createdAt,
  });
}