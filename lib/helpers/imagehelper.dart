import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../providers/data_provider.dart';
import 'mlhelper.dart';

class ImageHelper {
  Future pickImage(DataProvider dataProvider) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      XFile img = XFile(image.path);
      img = (await cropImage(imageFile: img))!;
      String txt = await MLHelper().textFromImage(img.path);
      String recognizedLanguage = await MLHelper().recognizeLanguage(txt);

      dataProvider.changeImage(img);
      dataProvider.changeEditText(txt.isEmpty ? 'Nie wykryto tekstu' : txt);
      dataProvider.changeTranslatedText(
          txt.isEmpty ? 'Brak tłumaczenia' : txt, recognizedLanguage);
      dataProvider.changeLanguage(recognizedLanguage);
    } on PlatformException catch (e) {
      throw Exception(e);
    }
  }

  Future<XFile?> cropImage({required XFile imageFile}) async {
    CroppedFile? croppedImage =
        await ImageCropper().cropImage(sourcePath: imageFile.path, uiSettings: [
      AndroidUiSettings(
        toolbarTitle: 'Zaznacz tekst do przetłumaczenia',
        lockAspectRatio: false,
      ),
      IOSUiSettings(
        title: 'Zaznacz tekst do przetłumaczenia',
      )
    ]);
    if (croppedImage == null) return null;
    return XFile(croppedImage.path);
  }
}
