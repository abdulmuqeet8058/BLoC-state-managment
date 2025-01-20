import 'package:bloc_stmgt/bloc/posts(GET%20API)/posts_events.dart';
import 'package:bloc_stmgt/bloc/posts(GET%20API)/posts_state.dart';
import 'package:bloc_stmgt/model/post_model.dart';
import 'package:bloc_stmgt/repository/post_repository.dart';
import 'package:bloc_stmgt/utils/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostBloc extends Bloc<PostsEvents, PostsStates> {
  List<postModel> temppost = [];
  PostRepository postRepository = PostRepository();

  PostBloc() : super(PostsStates()) {
    on<PostsFetched>(fetchPost);
    on<SearchItem>(_filterList);
  }
  void fetchPost(PostsFetched event, Emitter<PostsStates> emit) async {
    await postRepository.fetchPost().then((value) {
      emit(state.copyWith(
          poststatus: PostStatus.success, message: "success", postList: value));
    }).onError((error, stackTrace) {
      emit(state.copyWith(
          poststatus: PostStatus.failure, message: error.toString()));
    });
  }

  void _filterList(SearchItem event, Emitter<PostsStates> emit) async {
    if (event.search.isEmpty) {
      emit(state.copyWith(tempList: [], searchMessage: ''));
    } else if (event.search.isNotEmpty) {
      // temppost = state.postList
      //     .where((element) => element.id.toString() == event.search.toString())
      //     .toList();
      temppost = state.postList
          .where((element) => element.email
              .toString()
              .toLowerCase()
              .contains(event.search.toLowerCase()))
          .toList();
      if (temppost.isEmpty) {
        emit(
          state.copyWith(tempList: temppost, searchMessage: "No post found"),
        );
      } else {
        emit(state.copyWith(tempList: temppost, searchMessage: ''));
      }
    }
  }
}
