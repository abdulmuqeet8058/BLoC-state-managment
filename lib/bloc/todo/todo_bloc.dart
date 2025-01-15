import 'package:bloc/bloc.dart';
import 'package:bloc_stmgt/bloc/todo/todo_events.dart';
import 'package:bloc_stmgt/bloc/todo/todo_state.dart';

class TodoBloc extends Bloc<TodoEvents, TodoState> {
  final List<String> todosList = [];
  TodoBloc() : super(const TodoState()) {
    on<AddTodoEvent>(_AddtodoEvent);
    on<RemoveTodoEvent>(_RemovetodoEvent);
  }
  void _AddtodoEvent(AddTodoEvent event, Emitter<TodoState> emit) {
    todosList.add(event.task);
    emit(state.copyWith(todolist: List.from(todosList)));
  }

  void _RemovetodoEvent(RemoveTodoEvent event, Emitter<TodoState> emit) {
    todosList.remove(event.task);
    emit(state.copyWith(todolist: List.from(todosList)));
  }
}
