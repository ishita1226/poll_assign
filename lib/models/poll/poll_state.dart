import 'package:equatable/equatable.dart';
import 'poll.dart';

abstract class PollState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PollInitial extends PollState {}

class PollLoading extends PollState {}

class PollLoaded extends PollState {
  final List<Poll> polls;
  
  PollLoaded(this.polls);
  
  @override
  List<Object?> get props => [polls];
}

class PollError extends PollState {
  final String message;
  
  PollError(this.message);
  
  @override
  List<Object?> get props => [message];
}
