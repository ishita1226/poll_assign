import 'package:abhiman_assignment/models/poll/poll_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'poll.dart';
import 'package:abhiman_assignment/models/poll/poll_bloc.dart';

// class PollOptions extends StatelessWidget {
//   final Poll poll;

//   const PollOptions({Key? key, required this.poll}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: poll.options.map((option) {
//         final percentage = poll.votedUsers.isNotEmpty
//             ? (option.votes / poll.votedUsers.length) * 100
//             : 0.0;

//         return GestureDetector(
//           onTap: () {
//             if (!poll.votedUsers.contains('currentUserId')) {
//               context.read<PollBloc>().add(VotePoll(poll.id, option.id));
//             }
//           },
//           child: Container(
//             margin: EdgeInsets.symmetric(vertical: 8.0),
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.grey),
//               borderRadius: BorderRadius.circular(8.0),
//             ),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(8.0),
//               child: Stack(
//                 children: [
//                   LinearProgressIndicator(
//                     value: percentage / 100,
//                     backgroundColor: Colors.transparent,
//                     minHeight: 45,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.all(12.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(option.text),
//                         Text('${percentage.toStringAsFixed(1)}%'),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       }).toList(),
//     );
//   }
// }


class PollOptions extends StatelessWidget {
  final Poll poll;

  const PollOptions({required this.poll});

  @override
  Widget build(BuildContext context) {
    final hasVoted = poll.votedUsers.contains('currentUserId');
    final totalVotes = poll.options.fold(0, (sum, option) => sum + option.votes);

    return Column(
      children: poll.options.map((option) {
        final percentage = totalVotes > 0
            ? (option.votes / totalVotes) * 100
            : 0.0;

        return InkWell(
          onTap: hasVoted ? null : () {
            context.read<PollBloc>().add(VotePoll(poll.id, option.id));
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: hasVoted && poll.votedUsers.contains('currentUserId')
                  ? Colors.blue.withOpacity(0.2)
                  : Colors.transparent,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(option.text),
                ),
                if (hasVoted) Text('${percentage.toStringAsFixed(1)}%'),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
