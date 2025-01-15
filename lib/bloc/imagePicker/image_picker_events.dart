import 'package:equatable/equatable.dart';

abstract class ImagePickerEvents extends Equatable {
  ImagePickerEvents();
  @override
  List<Object> get props => [];
}

class cameraCapture extends ImagePickerEvents {}

class gallaryImagePicker extends ImagePickerEvents {}
