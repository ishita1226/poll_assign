import 'package:abhiman_assignment/models/comment/comment.dart';
import 'package:abhiman_assignment/models/poll/poll.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static const String pollBoxName = 'polls';
  static const String commentBoxName = 'comments';

  Future<void> init() async {
    await Hive.initFlutter();
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(PollAdapter());
    }
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(PollOptionAdapter());
    }
    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(CommentAdapter());
    }
    await Hive.openBox<Poll>(pollBoxName);
    await Hive.openBox<Comment>(commentBoxName);
  }

  Future<List<Comment>> getComments(String pollId) async {
    final box = Hive.box<Comment>(commentBoxName);
    return box.values
        .where((comment) => comment.pollId == pollId)
        .toList()
        ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }

  Future<void> addComment(Comment comment) async {
    final box = Hive.box<Comment>(commentBoxName);
    await box.put(comment.id, comment);
  }

  Future<void> toggleLike(String pollId) async {
    final box = Hive.box<Poll>(pollBoxName);
    final poll = box.get(pollId);
    if (poll != null) {
      final userId = 'currentUserId'; // Replace with actual user ID
      if (poll.likes.contains(userId)) {
        poll.likes.remove(userId);
      } else {
        poll.likes.add(userId);
      }
      await box.put(pollId, poll);
    }
  }
Future<List<Poll>> getPolls() async {
    final box = Hive.box<Poll>(pollBoxName);
    return box.values.toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }

  Future<void> addPoll(Poll poll) async {
    final box = Hive.box<Poll>(pollBoxName);
    await box.put(poll.id, poll);
  }

  Future<void> votePoll(String pollId, String optionId) async {
    final box = Hive.box<Poll>(pollBoxName);
    final poll = box.get(pollId);
    if (poll != null) {
      final option = poll.options.firstWhere((opt) => opt.id == optionId);
      option.votes++;
      poll.votedUsers.add('currentUserId'); // Replace with actual user ID
      await box.put(pollId, poll);
    }
  }


}
