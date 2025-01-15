import 'dart:io';

import 'package:bloc_stmgt/bloc/imagePicker/image_picker_bloc.dart';
import 'package:bloc_stmgt/bloc/imagePicker/image_picker_events.dart';
import 'package:bloc_stmgt/bloc/imagePicker/image_picker_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerUi extends StatefulWidget {
  const ImagePickerUi({super.key});

  @override
  State<ImagePickerUi> createState() => _ImagePickerUiState();
}

class _ImagePickerUiState extends State<ImagePickerUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("image picker bloc"),
      ),
      body: Center(
        child: BlocBuilder<ImagePickerBloc, ImagePickerState>(
          builder: (context, state) {
            if (state.file == null) {
              return GestureDetector(
                onTap: () {
                  context.read<ImagePickerBloc>().add(cameraCapture());
                },
                child: CircleAvatar(
                  child: Icon(Icons.camera),
                ),
              );
            } else {
              return Image.file(File(state.file!.path.toString()));
            }
          },
        ),
      ),
    );
  }
}
