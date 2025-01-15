import 'package:bloc_stmgt/bloc/imagePicker/image_picker_events.dart';
import 'package:bloc_stmgt/bloc/imagePicker/image_picker_state.dart';
import 'package:bloc_stmgt/utils/imagePickerUtils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvents, ImagePickerState> {
  final Imagepickerutils imagepickerutils;

  ImagePickerBloc(this.imagepickerutils) : super(ImagePickerState()) {
    on<cameraCapture>(_cameraCapture);
    on<gallaryImagePicker>(_gallaryImagepicker);
  }

  void _cameraCapture(
      cameraCapture events, Emitter<ImagePickerState> states) async {
    XFile? file = await imagepickerutils.cameraCapture();
    emit(state.copyWith(file: file));
  }

  void _gallaryImagepicker(
      gallaryImagePicker events, Emitter<ImagePickerState> states) async {
    XFile? file = await imagepickerutils.pickImageFromGallary();
    emit(state.copyWith(file: file));
  }
}
