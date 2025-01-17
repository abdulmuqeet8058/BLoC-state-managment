import 'package:bloc_stmgt/model/post_model.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc_stmgt/utils/enums.dart';

class PostsStates extends Equatable {
  final PostStatus poststatus;
  final List<postModel> postList;
  final String message;
  final List<postModel> tempList;
  final String searchMessage;
  const PostsStates(
      {this.poststatus = PostStatus.loading,
      this.searchMessage = '',
      this.tempList = const <postModel>[],
      this.postList = const <postModel>[],
      this.message = ''});
  PostsStates copyWith(
      {PostStatus? poststatus,
      String? searchMessage,
      List<postModel>? postList,
      List<postModel>? tempList,
      String? message}) {
    return PostsStates(
        poststatus: poststatus ?? this.poststatus,
        postList: postList ?? this.postList,
        message: message ?? this.message,
        tempList: tempList ?? this.tempList,
        searchMessage: searchMessage ?? this.searchMessage);
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [poststatus, postList, message, tempList, searchMessage];
}
