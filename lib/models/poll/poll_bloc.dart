import 'package:abhiman_assignment/models/poll/poll.dart';
import 'package:abhiman_assignment/models/poll/poll_card.dart';
import 'package:abhiman_assignment/models/poll/poll_event.dart';
import 'package:abhiman_assignment/models/poll/poll_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:abhiman_assignment/services/hive_service.dart';

class PollBloc extends Bloc<PollEvent, PollState> {
  final HiveService _hiveService;

  PollBloc(this._hiveService) : super(PollInitial()) {
    on<LoadPolls>(_onLoadPolls);
    on<AddPoll>(_onAddPoll);
    on<VotePoll>(_onVotePoll);
    on<ToggleLike>(_onToggleLike);
  }

  Future<void> _onVotePoll(VotePoll event, Emitter<PollState> emit) async {
    if (state is PollLoaded) {
      final currentState = state as PollLoaded;
      final updatedPolls = currentState.polls.map((poll) {
        if (poll.id == event.pollId) {
          final updatedOptions = poll.options.map((option) {
            if (option.id == event.optionId) {
              return PollOption(
                id: option.id,
                text: option.text,
                votes: option.votes + 1,
              );
            }
            return option;
          }).toList();

          return Poll(
            id: poll.id,
            question: poll.question,
            options: updatedOptions,
            createdAt: poll.createdAt,
            votedUsers: [...poll.votedUsers, 'currentUserId'],
            likes: poll.likes,
          );
        }
        return poll;
      }).toList();

      emit(PollLoaded(updatedPolls));
      await _hiveService.votePoll(event.pollId, event.optionId);
    }
  }

  Future<void> _onToggleLike(ToggleLike event, Emitter<PollState> emit) async {
    if (state is PollLoaded) {
      final currentState = state as PollLoaded;
      final updatedPolls = currentState.polls.map((poll) {
        if (poll.id == event.pollId) {
          final likes = List<String>.from(poll.likes);
          if (likes.contains('currentUserId')) {
            likes.remove('currentUserId');
          } else {
            likes.add('currentUserId');
          }

          return Poll(
            id: poll.id,
            question: poll.question,
            options: poll.options,
            createdAt: poll.createdAt,
            votedUsers: poll.votedUsers,
            likes: likes,
          );
        }
        return poll;
      }).toList();

      emit(PollLoaded(updatedPolls));
      await _hiveService.toggleLike(event.pollId);
    }
  }

  Future<void> _onLoadPolls(LoadPolls event, Emitter<PollState> emit) async {
    emit(PollLoading());
    try {
      final polls = await _hiveService.getPolls();
      emit(PollLoaded(polls));
    } catch (e) {
      emit(PollError(e.toString()));
    }
  }

  Future<void> _onAddPoll(AddPoll event, Emitter<PollState> emit) async {
    try {
      await _hiveService.addPoll(event.poll);
      final polls = await _hiveService.getPolls();
      emit(PollLoaded(polls));
    } catch (e) {
      emit(PollError(e.toString()));
    }
  }
}
