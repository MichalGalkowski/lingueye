import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lingueye/styles/my_styles.dart';
import 'package:provider/provider.dart';

import '../providers/data_provider.dart';

class ShowImage extends StatefulWidget {
  const ShowImage({super.key});

  @override
  State<ShowImage> createState() => _ShowImageState();
}

class _ShowImageState extends State<ShowImage> {
  bool showImage = false;
  XFile _img = XFile('');

  @override
  void initState() {
    DataProvider dataProvider =
        Provider.of<DataProvider>(context, listen: false);
    super.initState();
    _img = dataProvider.getImage;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.height,
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        InkWell(
          onTap: () => setState(() => showImage = showImage ? false : true),
          child: Text(
            showImage ? 'Ukryj zdjęcie' : 'Pokaż zdjęcie',
            style: MyStyles.textButtonLight,
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
    );
  }
}
