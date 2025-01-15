import 'package:equatable/equatable.dart';

class TodoState extends Equatable {
  final List<String> todosList;
  const TodoState({this.todosList = const []});
  TodoState copyWith({List<String>? todolist}) {
    return TodoState(todosList: todolist ?? this.todosList);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [todosList];
}
