import 'package:abhiman_assignment/models/comment_event.dart';
import 'package:abhiman_assignment/models/comment_state.dart';
import 'package:abhiman_assignment/services/hive_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final HiveService _hiveService;

  CommentBloc(this._hiveService) : super(CommentInitial()) {
    on<LoadComments>(_onLoadComments);
    on<AddComment>(_onAddComment);
  }

  Future<void> _onLoadComments(LoadComments event, Emitter<CommentState> emit) async {
    emit(CommentLoading());
    try {
      final comments = await _hiveService.getComments(event.pollId);
      emit(CommentLoaded(comments));
    } catch (e) {
      emit(CommentError(e.toString()));
    }
  }

  Future<void> _onAddComment(AddComment event, Emitter<CommentState> emit) async {
    try {
      await _hiveService.addComment(event.comment);
      final comments = await _hiveService.getComments(event.comment.pollId);
      emit(CommentLoaded(comments));
    } catch (e) {
      emit(CommentError(e.toString()));
    }
  }
}
