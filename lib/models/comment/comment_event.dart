import 'package:abhiman_assignment/models/comment/comment.dart';
import 'package:equatable/equatable.dart';

abstract class CommentEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadComments extends CommentEvent {
  final String pollId;
  
  LoadComments(this.pollId);
  
  @override
  List<Object?> get props => [pollId];
}

class AddComment extends CommentEvent {
  final Comment comment;
  
  AddComment(this.comment);
  
  @override
  List<Object?> get props => [comment];
}