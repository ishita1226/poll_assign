import 'package:abhiman_assignment/models/poll/poll_card.dart';
import 'package:abhiman_assignment/models/poll/poll_event.dart';
import 'package:abhiman_assignment/models/poll/poll_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../services/hive_service.dart';

class PollBloc extends Bloc<PollEvent, PollState> {
  final HiveService _hiveService;

  PollBloc(this._hiveService) : super(PollInitial()) {
    on<LoadPolls>(_onLoadPolls);
    on<AddPoll>(_onAddPoll);
    on<VotePoll>(_onVotePoll);
    on<ToggleLike>(_onToggleLike);
  }

  Future<void> _onToggleLike(ToggleLike event, Emitter<PollState> emit) async {
    try {
      await _hiveService.toggleLike(event.pollId);
      final polls = await _hiveService.getPolls();
      emit(PollLoaded(polls));
    } catch (e) {
      emit(PollError(e.toString()));
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

  Future<void> _onVotePoll(VotePoll event, Emitter<PollState> emit) async {
    try {
      await _hiveService.votePoll(event.pollId, event.optionId);
      final polls = await _hiveService.getPolls();
      emit(PollLoaded(polls));
    } catch (e) {
      emit(PollError(e.toString()));
    }
  }
}
