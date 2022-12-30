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

  Future<String> translateText(String text) async {
    const TranslateLanguage sourceLanguage = TranslateLanguage.english;
    const TranslateLanguage targetLanguage = TranslateLanguage.polish;

    final onDeviceTranslator = OnDeviceTranslator(
        sourceLanguage: sourceLanguage, targetLanguage: targetLanguage);
    final String response = await onDeviceTranslator.translateText(text);
    onDeviceTranslator.close();
    return response;
  }
}
