import 'package:google_mlkit_language_id/google_mlkit_language_id.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';

class MLHelper {
  Future<String> textFromImage(String path) async {
    final inputImage = InputImage.fromFilePath(path);
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);
    String text = recognizedText.text;
    textRecognizer.close();
    return text;
  }

  Future<String> translateText(String text, String language) async {
    TranslateLanguage sourceLanguage;
    switch (language) {
      case 'un':
        sourceLanguage = TranslateLanguage.polish;
        break;
      case 'en':
        sourceLanguage = TranslateLanguage.english;
        break;
      case 'pl':
        sourceLanguage = TranslateLanguage.polish;
        break;
      case 'de':
        sourceLanguage = TranslateLanguage.german;
        break;
      case 'es':
        sourceLanguage = TranslateLanguage.spanish;
        break;
      case 'pt':
        sourceLanguage = TranslateLanguage.portuguese;
        break;
      case 'it':
        sourceLanguage = TranslateLanguage.italian;
        break;
      case 'fr':
        sourceLanguage = TranslateLanguage.french;
        break;
      case 'nl':
        sourceLanguage = TranslateLanguage.dutch;
        break;
      case 'af':
        sourceLanguage = TranslateLanguage.afrikaans;
        break;
      case 'ar-Latn':
        sourceLanguage = TranslateLanguage.arabic;
        break;
      case 'bg-Latn':
        sourceLanguage = TranslateLanguage.bulgarian;
        break;
      case 'ca':
        sourceLanguage = TranslateLanguage.catalan;
        break;
      case 'cs':
        sourceLanguage = TranslateLanguage.czech;
        break;
      case 'cy':
        sourceLanguage = TranslateLanguage.welsh;
        break;
      case 'da':
        sourceLanguage = TranslateLanguage.danish;
        break;
      case 'sv':
        sourceLanguage = TranslateLanguage.swedish;
        break;
      case 'no':
        sourceLanguage = TranslateLanguage.norwegian;
        break;
      case 'el-Latn':
        sourceLanguage = TranslateLanguage.greek;
        break;
      case 'eo':
        sourceLanguage = TranslateLanguage.esperanto;
        break;
      case 'et':
        sourceLanguage = TranslateLanguage.estonian;
        break;
      case 'fi':
        sourceLanguage = TranslateLanguage.finnish;
        break;
      case 'ga':
        sourceLanguage = TranslateLanguage.irish;
        break;
      case 'gl':
        sourceLanguage = TranslateLanguage.galician;
        break;
      case 'hi-Latn':
        sourceLanguage = TranslateLanguage.hindi;
        break;
      case 'hr':
        sourceLanguage = TranslateLanguage.croatian;
        break;
      case 'ht':
        sourceLanguage = TranslateLanguage.haitian;
        break;
      case 'hu':
        sourceLanguage = TranslateLanguage.hungarian;
        break;
      case 'id':
        sourceLanguage = TranslateLanguage.indonesian;
        break;
      case 'is':
        sourceLanguage = TranslateLanguage.icelandic;
        break;
      case 'ja-Latn':
        sourceLanguage = TranslateLanguage.japanese;
        break;
      case 'lt':
        sourceLanguage = TranslateLanguage.lithuanian;
        break;
      case 'lv':
        sourceLanguage = TranslateLanguage.latvian;
        break;
      case 'ms':
        sourceLanguage = TranslateLanguage.malay;
        break;
      case 'mt':
        sourceLanguage = TranslateLanguage.maltese;
        break;
      case 'ro':
        sourceLanguage = TranslateLanguage.romanian;
        break;
      case 'sk':
        sourceLanguage = TranslateLanguage.slovak;
        break;
      case 'sl':
        sourceLanguage = TranslateLanguage.slovenian;
        break;
      case 'sq':
        sourceLanguage = TranslateLanguage.albanian;
        break;
      case 'sw':
        sourceLanguage = TranslateLanguage.swahili;
        break;
      case 'vi':
        sourceLanguage = TranslateLanguage.vietnamese;
        break;
      case 'zh-Latn':
        sourceLanguage = TranslateLanguage.chinese;
        break;
      default:
        sourceLanguage = TranslateLanguage.polish;
        break;
    }
    const TranslateLanguage targetLanguage = TranslateLanguage.polish;

    final onDeviceTranslator = OnDeviceTranslator(
        sourceLanguage: sourceLanguage, targetLanguage: targetLanguage);
    final String response = await onDeviceTranslator.translateText(text);
    onDeviceTranslator.close();
    return response;
  }

  Future<String> recognizeLanguage(String text) async {
    final languageIdentifier = LanguageIdentifier(confidenceThreshold: 0.5);
    final String response = await languageIdentifier.identifyLanguage(text);

    return response;
  }
}
