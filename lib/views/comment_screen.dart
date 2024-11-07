import 'package:abhiman_assignment/models/comment.dart';
import 'package:abhiman_assignment/models/comment_event.dart';
import 'package:abhiman_assignment/models/comment_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import 'package:abhiman_assignment/models/comment_bloc.dart';

class CommentScreen extends StatelessWidget {
  final String pollId;
  final TextEditingController _commentController = TextEditingController();

  CommentScreen({required this.pollId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Comments')),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<CommentBloc, CommentState>(
              builder: (context, state) {
                if (state is CommentLoaded) {
                  return ListView.builder(
                    itemCount: state.comments.length,
                    itemBuilder: (context, index) {
                      final comment = state.comments[index];
                      return ListTile(
                        title: Text(comment.text),
                        subtitle: Text(
                          comment.createdAt.toString(),
                          style: TextStyle(fontSize: 12),
                        ),
                      );
                    },
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _commentController,
                    decoration: InputDecoration(
                      hintText: 'Write a comment...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    if (_commentController.text.isNotEmpty) {
                      context.read<CommentBloc>().add(
                            AddComment(
                              Comment(
                                id: const Uuid().v4(),
                                pollId: pollId,
                                text: _commentController.text,
                                createdAt: DateTime.now(),
                              ),
                            ),
                          );
                      _commentController.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
        ),
    );
  }
}
