// import 'package:abhiman_assignment/models/poll/poll_bloc.dart';
// import 'package:abhiman_assignment/models/poll/poll_event.dart';
// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:abhiman_assignment/models/poll/poll.dart';
// // import '../../blocs/poll/poll_bloc.dart';

// class PollOptions extends StatelessWidget {
//   final Poll poll;

//   const PollOptions({required this.poll});

//   @override
//   Widget build(BuildContext context) {
//     final hasVoted = poll.votedUsers.contains('currentUserId');

//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//       child: hasVoted ? _buildResultsGraph() : _buildVotingOptions(context),
//     );
//   }

//   Widget _buildVotingOptions(BuildContext context) {
//     return Column(
//       children: poll.options.map((option) {
//         return InkWell(
//           onTap: () {
//             context.read<PollBloc>().add(VotePoll(poll.id, option.id));
//           },
//           child: Container(
//             margin: EdgeInsets.symmetric(vertical: 8.0),
//             padding: EdgeInsets.all(16.0),
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.grey.shade300),
//               borderRadius: BorderRadius.circular(8.0),
//             ),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: Text(
//                     option.text,
//                     style: TextStyle(fontSize: 16.0),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       }).toList(),
//     );
//   }

//   Widget _buildResultsGraph() {
//     final totalVotes =
//         poll.options.fold(0, (sum, option) => sum + option.votes);

//     return Container(
//       height: 300,
//       padding: EdgeInsets.all(16.0),
//       child: Column(
//         children: [
//           Text(
//             'Results',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(height: 16),
//           Expanded(
//             child: BarChart(
//               BarChartData(
//                 alignment: BarChartAlignment.spaceAround,
//                 maxY: 100,
//                 barGroups: poll.options.asMap().entries.map((entry) {
//                   final percentage = totalVotes > 0
//                       ? (entry.value.votes / totalVotes) * 100
//                       : 0.0;
//                   return BarChartGroupData(
//                     x: entry.key,
//                     barRods: [
//                       BarChartRodData(
//                         toY: percentage,
//                         color: Colors.blue,
//                         width: 25,
//                         borderRadius: BorderRadius.vertical(
//                           top: Radius.circular(4),
//                         ),
//                       ),
//                     ],
//                   );
//                 }).toList(),
//                 titlesData: FlTitlesData(
//                   bottomTitles: AxisTitles(
//                     sideTitles: SideTitles(
//                       reservedSize: 30,
//                       getTitlesWidget: (value, meta) {
//                         return Padding(
//                           padding: EdgeInsets.only(top: 8.0),
//                           child: Text(
//                             poll.options[value.toInt()].text,
//                             textAlign: TextAlign.center,
//                             style: TextStyle(fontSize: 12),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                   leftTitles: AxisTitles(
//                     sideTitles: SideTitles(
//                       reservedSize: 40,
//                       getTitlesWidget: (value, meta) {
//                         return Text(
//                           '${value.toInt()}%',
//                           style: TextStyle(fontSize: 12),
//                         );
//                       },
//                     ),
//                   ),
//                   topTitles: AxisTitles(),
//                   rightTitles: AxisTitles(),
//                 ),
//                 gridData: FlGridData(show: false),
//                 borderData: FlBorderData(show: false),
//               ),
//             ),
//           ),
//           SizedBox(height: 16),
//           Text(
//             'Total Votes: $totalVotes',
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
