import 'package:image_picker/image_picker.dart';

class Imagepickerutils {
  final ImagePicker _picker = ImagePicker();
  Future<XFile?> cameraCapture() async {
    final XFile? file = await _picker.pickImage(source: ImageSource.camera);
    return file;
  }

  Future<XFile?> pickImageFromGallary() async {
    final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
    return file;
  }
}
