import 'package:equatable/equatable.dart';
import 'poll.dart';

abstract class PollEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadPolls extends PollEvent {}

class AddPoll extends PollEvent {
  final Poll poll;
  
  AddPoll(this.poll);
  
  @override
  List<Object?> get props => [poll];
}

class VotePoll extends PollEvent {
  final String pollId;
  final String optionId;
  
  VotePoll(this.pollId, this.optionId);
  
  @override
  List<Object?> get props => [pollId, optionId];
}
