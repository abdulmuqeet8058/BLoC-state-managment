import 'package:bloc_stmgt/bloc/counter/counterBloc.dart';
import 'package:bloc_stmgt/bloc/imagePicker/image_picker_bloc.dart';
import 'package:bloc_stmgt/bloc/switch/switch_bloc.dart';
import 'package:bloc_stmgt/bloc/todo/todo_bloc.dart';
import 'package:bloc_stmgt/ui/counter_screen.dart';
import 'package:bloc_stmgt/ui/image_picker_UI.dart';
import 'package:bloc_stmgt/ui/switch_UI.dart';
import 'package:bloc_stmgt/ui/todo_UI.dart';
import 'package:bloc_stmgt/utils/imagePickerUtils.dart';
import 'package:flutter/material.dart';
import "package:equatable/equatable.dart";
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => Counterbloc()),
        BlocProvider(create: (_) => SwitchBloc()),
        BlocProvider(create: (_) => ImagePickerBloc(Imagepickerutils())),
        BlocProvider(create: (_) => TodoBloc())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Todo(),
      ),
    );
  }
}
