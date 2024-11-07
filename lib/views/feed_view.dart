import 'package:abhiman_assignment/models/poll/poll_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:abhiman_assignment/models/poll/poll_bloc.dart';
import 'package:abhiman_assignment/models/poll/poll_card.dart';

class FeedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Poll Feed')),
      body: BlocBuilder<PollBloc, PollState>(
        builder: (context, state) {
          if (state is PollLoading) {
            return Center(child: CircularProgressIndicator());
          }
          
          if (state is PollError) {
            return Center(child: Text(state.message));
          }
          
          if (state is PollLoaded) {
            return ListView.builder(
              itemCount: state.polls.length,
              itemBuilder: (context, index) => PollCard(
                poll: state.polls[index],
              ),
            );
          }
          
          return Center(child: Text('No polls available'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/create-poll'),
        child: Icon(Icons.add),
      ),
    );
  }
}
