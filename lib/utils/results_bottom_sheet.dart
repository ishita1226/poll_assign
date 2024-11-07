import 'package:abhiman_assignment/models/poll/poll.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ResultsBottomSheet extends StatelessWidget {
  final Poll poll;

  const ResultsBottomSheet({required this.poll});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Poll Results',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          Expanded(
            child: BarChart(
              BarChartData(
                barGroups: _createBarGroups(),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      reservedSize: 30,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          poll.options[value.toInt()].text,
                          style: TextStyle(fontSize: 12),
                        );
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      reservedSize: 40,
                      getTitlesWidget: (value, meta) {
                        return Text('${value.toInt()}%');
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<BarChartGroupData> _createBarGroups() {
    final totalVotes = poll.options.fold(0, (sum, option) => sum + option.votes);
    
    return poll.options.asMap().entries.map((entry) {
      final percentage = totalVotes > 0
          ? (entry.value.votes / totalVotes) * 100
          : 0.0;
          
      return BarChartGroupData(
        x: entry.key,
        barRods: [
          BarChartRodData(
            toY: percentage,
            color: Colors.blue,
            width: 25,
            borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
          ),
        ],
      );
    }).toList();
  }
}
