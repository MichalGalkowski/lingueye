import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lingueye/helpers/mlhelper.dart';
import '../styles/my_styles.dart';

import '../styles/my_colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  XFile _img = XFile('');
  String _imageText = '';
  String _translatedText = '';

  Future _pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      XFile img = XFile(image.path);
      img = (await _cropImage(imageFile: img))!;
      String txt = await MLHelper().textFromImage(img.path);
      String translatedTxt = await MLHelper().translateText(txt);

      setState(() {
        _img = img;
        _imageText = txt.isEmpty ? 'Nie wykryto tekstu' : txt;
        _translatedText =
            translatedTxt.isEmpty ? 'Brak tłumaczenia' : translatedTxt;
      });
    } on PlatformException catch (e) {
      throw Exception(e);
    }
  }

  Future<XFile?> _cropImage({required XFile imageFile}) async {
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

  @override
  Widget build(BuildContext context) {
    bool isImage = _img.path.isNotEmpty;
    bool isText = _imageText.isNotEmpty;

    return Container(
      color: const Color(MyColors.background),
      child: SafeArea(
        child: Center(
            child: Column(
          children: [
            Container(
              height: 48.0,
              padding: const EdgeInsets.all(12.0),
              alignment: AlignmentDirectional.centerEnd,
              child: isImage
                  ? ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _img = XFile('');
                          _imageText = '';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: MyColors.mainMaterial[400]),
                      child: Text(
                        'Wyczyść',
                        style: MyStyles.textButtonDark,
                      ))
                  : const SizedBox(),
            ),
            Expanded(
              flex: 1,
              child: isImage
                  ? Image.file(File(_img.path))
                  : InkWell(
                      onTap: () => _pickImage(),
                      child: SvgPicture.asset(
                        'assets/logo.svg',
                        color: MyColors.mainMaterial,
                        width: MediaQuery.of(context).size.width * .6,
                      ),
                    ),
            ),
            TextButton(
                onPressed: () => _pickImage(),
                child: Text(
                  'Zrób zdjęcie tekstu do przetłumaczenia',
                  textAlign: TextAlign.center,
                  style: MyStyles.textHeader,
                )),
            Expanded(
                flex: 1, child: isText ? _buildTextCard() : const SizedBox()),
          ],
        )),
      ),
    );
  }

  _buildTextCard() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Expanded(
              child: Card(
                color: MyColors.mainMaterial[800],
                child: SingleChildScrollView(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        _imageText,
                        style: TextStyle(color: MyColors.mainMaterial[100]),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Card(
                color: MyColors.mainMaterial[800],
                child: SingleChildScrollView(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        _translatedText,
                        style: TextStyle(color: MyColors.mainMaterial[100]),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
