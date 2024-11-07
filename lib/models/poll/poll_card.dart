import 'package:abhiman_assignment/models/poll/poll.dart';
import 'package:abhiman_assignment/models/poll/poll_event.dart';
import 'package:abhiman_assignment/models/poll/poll_options.dart';
import 'package:abhiman_assignment/viewmodels/utils/comment_bottom_sheet.dart';
import 'package:abhiman_assignment/viewmodels/utils/results_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:abhiman_assignment/models/poll/poll_bloc.dart';

class ToggleLike extends PollEvent {
  final String pollId;

  ToggleLike(this.pollId);

  @override
  List<Object?> get props => [pollId];
}



class PollCard extends StatelessWidget {
  final Poll poll;

  const PollCard({required this.poll});

  @override
  Widget build(BuildContext context) {
    final hasVoted = poll.votedUsers.contains('currentUserId');
    final hasLiked = poll.likes.contains('currentUserId');

    return Card(
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => ResultsBottomSheet(poll: poll),
              );
            },
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                poll.question,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          PollOptions(poll: poll),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: hasLiked ? Colors.red : Colors.grey,
                    ),
                    onPressed: () {
                      context.read<PollBloc>().add(ToggleLike(poll.id));
                    },
                  ),
                  Text(
                    '${poll.likes.length} ${poll.likes.length == 1 ? 'like' : 'likes'}',
                  ),
                ],
              ),
              IconButton(
                icon: Icon(Icons.comment),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => CommentBottomSheet(pollId: poll.id),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
