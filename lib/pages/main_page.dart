import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
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
  String _translatedText = '';
  bool showImage = false;
  final _imageText = TextEditingController();

  void _clearData() {
    _img = XFile('');
    _imageText.value = TextEditingValue.empty;
    setState(() {});
  }

  Future _updateTranslation(String text) async {
    _translatedText = await MLHelper().translateText(text);
    setState(() {});
  }

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
        _imageText.value =
            TextEditingValue(text: txt.isEmpty ? 'Nie wykryto tekstu' : txt);
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
    bool isText = _imageText.value.text.isNotEmpty;

    return Container(
      color: const Color(MyColors.background),
      child: SafeArea(
        child: Center(
            child: Column(
          children: [
            isImage
                ? Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 12,
                        ),
                        InkWell(
                          onTap: () => _pickImage(),
                          child: SvgPicture.asset(
                            'assets/logo.svg',
                            color: MyColors.mainMaterial,
                            width: 80,
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        FittedBox(
                          child: Text(
                            'LinguEye',
                            style: GoogleFonts.kodchasan(
                                color: MyColors.mainMaterial,
                                fontWeight: FontWeight.w300,
                                fontSize: 32.0),
                          ),
                        ),
                        const Expanded(
                          child: SizedBox(),
                        ),
                        ElevatedButton(
                            onPressed: () => _clearData(),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: MyColors.mainMaterial[400]),
                            child: Text(
                              'Wyczyść',
                              style: MyStyles.textButtonDark,
                            )),
                      ],
                    ),
                  )
                : SizedBox(
                    height: MediaQuery.of(context).size.height * .7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: InkWell(
                            onTap: () => _pickImage(),
                            child: SvgPicture.asset(
                              'assets/logo.svg',
                              color: MyColors.mainMaterial,
                              width: isImage
                                  ? 80
                                  : MediaQuery.of(context).size.width * .6,
                            ),
                          ),
                        ),
                        Text(
                          'LinguEye',
                          style: GoogleFonts.kodchasan(
                              color: MyColors.mainMaterial,
                              fontWeight: FontWeight.w300,
                              fontSize: 48.0),
                        ),
                        TextButton(
                            onPressed: () => _pickImage(),
                            child: Text(
                              'Zrób zdjęcie tekstu do przetłumaczenia',
                              textAlign: TextAlign.center,
                              style: MyStyles.textHeader,
                            )),
                      ],
                    ),
                  ),
            isImage
                ? SizedBox(
                    child: Column(children: [
                      InkWell(
                        onTap: () => setState(
                            () => showImage = showImage ? false : true),
                        child: Text(
                          showImage ? 'Ukryj zdjęcie' : 'Pokaż zdjęcie',
                          style: GoogleFonts.kodchasan(
                              color: MyColors.mainMaterial[200],
                              fontWeight: FontWeight.w100,
                              fontSize: 16.0),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      showImage
                          ? Image.file(
                              File(_img.path),
                              height: 200,
                            )
                          : const SizedBox(),
                    ]),
                  )
                : const SizedBox(),
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
        child: Column(
          children: [
            Flexible(
              child: Card(
                color: MyColors.mainMaterial[800],
                child: SingleChildScrollView(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        onChanged: (value) {
                          if (value.isEmpty) {
                            return;
                          } else {
                            _updateTranslation(value);
                          }
                        },
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.multiline,
                        minLines: 1,
                        maxLines: 100,
                        controller: _imageText,
                        style: TextStyle(color: MyColors.mainMaterial[100]),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
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
