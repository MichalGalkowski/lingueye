import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lingueye/helpers/mlhelper.dart';

class DataProvider extends ChangeNotifier {
  //IMAGE
  XFile _image = XFile('');
  XFile get getImage => _image;
  void changeImage(XFile img) {
    _image = img;
    notifyListeners();
  }

  //EDIT TEXT
  String _editText = '';
  String get getEditText => _editText;
  void changeEditText(String txt) async {
    _editText = txt;
    changeTranslatedText(txt);
    notifyListeners();
  }

  //TRANSLATED TEXT
  String _translatedText = '';
  String get getTranslatedText => _translatedText;
  void changeTranslatedText(String txt) async {
    String translatedText = await MLHelper().translateText(txt, _language);
    _translatedText = translatedText;
    notifyListeners();
  }

  //LANGUAGE
  String _language = '';
  String get getLanguage => _language;
  void changeLanguage(String language) {
    _language = language;
    notifyListeners();
  }
}
