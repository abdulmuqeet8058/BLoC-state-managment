import 'package:bloc_stmgt/bloc/todo/todo_bloc.dart';
import 'package:bloc_stmgt/bloc/todo/todo_events.dart';
import 'package:bloc_stmgt/bloc/todo/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App"),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state.todosList.isEmpty) {
            return Center(
              child: Text("No todos found"),
            );
          } else if (state.todosList.isNotEmpty) {
            return ListView.builder(
              itemCount: state.todosList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.todosList[index]),
                  trailing: IconButton(
                      onPressed: () {
                        context
                            .read<TodoBloc>()
                            .add(RemoveTodoEvent(task: state.todosList[index]));
                      },
                      icon: Icon(Icons.delete)),
                );
              },
            );
          } else {
            return const SizedBox();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          for (int i = 1; i <= 5; i++) {
            context
                .read<TodoBloc>()
                .add(AddTodoEvent(task: 'Task ' + i.toString()));
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
