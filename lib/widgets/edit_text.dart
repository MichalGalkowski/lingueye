import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/data_provider.dart';
import '../styles/my_colors.dart';

class EditText extends StatefulWidget {
  const EditText({super.key});

  @override
  State<EditText> createState() => _EditTextState();
}

class _EditTextState extends State<EditText> {
  late TextEditingController _imageText;

  @override
  void initState() {
    DataProvider dataProvider = Provider.of(context, listen: false);
    super.initState();
    _imageText = TextEditingController(text: dataProvider.getEditText);
  }

  @override
  void dispose() {
    _imageText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DataProvider dataProvider = Provider.of(context);
    return Card(
      color: MyColors.mainMaterial[800],
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged: (value) {
                dataProvider.changeEditText(value);
                dataProvider.changeTranslatedText(
                    value, dataProvider.getLanguage);
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
    );
  }
}
