import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '../styles/my_styles.dart';

import '../styles/my_colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  XFile _img = XFile('');

  Future _pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      XFile img = XFile(image.path);
      img = (await _cropImage(imageFile: img))!;

      setState(() {
        _img = img;
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
    return Container(
      color: const Color(MyColors.background),
      child: Center(
          child: Column(
        children: [
          const SizedBox(
            height: 48.0,
          ),
          Expanded(
            flex: 3,
            child: SvgPicture.asset(
              'assets/logo.svg',
              color: MyColors.mainMaterial,
              width: MediaQuery.of(context).size.width * .6,
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
              flex: 1,
              child: _img.path.isEmpty
                  ? const SizedBox()
                  : Image.file(File(_img.path))),
        ],
      )),
    );
  }
}
