import 'package:hive/hive.dart';
part 'poll.g.dart';

@HiveType(typeId: 0)
class Poll extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String question;

  @HiveField(2)
  final List<PollOption> options;

  @HiveField(3)
  final DateTime createdAt;

  @HiveField(4)
  final DateTime? expiryDate;

  @HiveField(5)
  final List<String> votedUsers;

  @HiveField(6)
  final List<String> likes;

  Poll({
    required this.id,
    required this.question,
    required this.options,
    required this.createdAt,
    this.expiryDate,
    required this.votedUsers,
    required this.likes,
  });
}

@HiveType(typeId: 1)
class PollOption extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String text;

  @HiveField(2)
  int votes;

  PollOption({
    required this.id,
    required this.text,
    this.votes = 0,
  });
}
