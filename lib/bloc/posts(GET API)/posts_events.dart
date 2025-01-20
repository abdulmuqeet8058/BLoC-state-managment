import 'package:equatable/equatable.dart';

abstract class PostsEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class PostsFetched extends PostsEvents {}

class SearchItem extends PostsEvents {
  final String search;

  SearchItem(this.search);
}
