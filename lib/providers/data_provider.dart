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
  void changeEditText(String txt) {
    _editText = txt;
    // changeTranslatedText(txt);
    notifyListeners();
  }

  //TRANSLATED TEXT
  String _translatedText = '';
  String get getTranslatedText => _translatedText;
  void changeTranslatedText(String txt, String language) async {
    String translatedText = await MLHelper().translateText(txt, language);
    _translatedText = translatedText;
    notifyListeners();
  }

  //LANGUAGE
  String _language = '';
  String get getLanguage => _language;
  void changeLanguage(String language) {
    _language = language;
    switchLanguageName();
    notifyListeners();
  }

  String _languageName = '';
  String get getLanguageName => _languageName;

  //LANGUAGE SWITCH
  void switchLanguageName() {
    switch (_language) {
      case 'un':
        _languageName = 'niezdefiniowany';
        break;
      case 'en':
        _languageName = 'angielski';
        break;
      case 'pl':
        _languageName = 'polski';
        break;
      case 'de':
        _languageName = 'niemiecki';
        break;
      case 'es':
        _languageName = 'hiszpański';
        break;
      case 'pt':
        _languageName = 'portugalski';
        break;
      case 'it':
        _languageName = 'włoski';
        break;
      case 'fr':
        _languageName = 'francuski';
        break;
      case 'nl':
        _languageName = 'niderlandzki';
        break;
      case 'af':
        _languageName = 'afrikaans';
        break;
      case 'ar-Latn':
        _languageName = 'arabski';
        break;
      case 'bg-Latn':
        _languageName = 'bułgarski';
        break;
      case 'ca':
        _languageName = 'kataloński';
        break;
      case 'cs':
        _languageName = 'czeski';
        break;
      case 'cy':
        _languageName = 'walijski';
        break;
      case 'da':
        _languageName = 'duński';
        break;
      case 'sv':
        _languageName = 'szwedzki';
        break;
      case 'no':
        _languageName = 'norweski';
        break;
      case 'el-Latn':
        _languageName = 'grecki';
        break;
      case 'eo':
        _languageName = 'esperanto';
        break;
      case 'et':
        _languageName = 'estoński';
        break;
      case 'fi':
        _languageName = 'fiński';
        break;
      case 'ga':
        _languageName = 'irlandzki';
        break;
      case 'gl':
        _languageName = 'galicyjski';
        break;
      case 'hi-Latn':
        _languageName = 'hindi';
        break;
      case 'hr':
        _languageName = 'chorwacki';
        break;
      case 'ht':
        _languageName = 'haitański';
        break;
      case 'hu':
        _languageName = 'węgierski';
        break;
      case 'id':
        _languageName = 'indonezyjski';
        break;
      case 'is':
        _languageName = 'islandzki';
        break;
      case 'ja-Latn':
        _languageName = 'japoński';
        break;
      case 'lt':
        _languageName = 'litewski';
        break;
      case 'lv':
        _languageName = 'łotewski';
        break;
      case 'ms':
        _languageName = 'malajski';
        break;
      case 'mt':
        _languageName = 'maltański';
        break;
      case 'ro':
        _languageName = 'rumuński';
        break;
      case 'sk':
        _languageName = 'słowacki';
        break;
      case 'sl':
        _languageName = 'słoweński';
        break;
      case 'sq':
        _languageName = 'albański';
        break;
      case 'sw':
        _languageName = 'suahili';
        break;
      case 'vi':
        _languageName = 'wietnamski';
        break;
      case 'zh-Latn':
        _languageName = 'chiński';
        break;
      default:
        _languageName = 'niezdefiniowany';
        break;
    }
  }
}
