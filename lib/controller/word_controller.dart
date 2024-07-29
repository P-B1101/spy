import 'dart:convert';
import 'dart:math';

import 'package:spy/json_reader.dart';
import 'package:spy/model/word.dart';

class WordController {
  WordController._();
  static final random = Random();
  static List<Word>? _categoryWords;
  static final _words = List<String>.empty(growable: true);

  static Future<void> loadWords() async {
    final data = await JsonReader.loadJsonString('words');
    final items = json.decode(data);
    _categoryWords =
        items is! List ? <Word>[] : items.map((e) => Word.fromJson(e)).toList();
    for (int i = 0; i < _categoryWords!.length; i++) {
      _words.addAll(_categoryWords![i].words);
    }
  }

  static List<Word> get words => _categoryWords ?? [];

  static bool get isWordsLoaded =>
      _categoryWords != null && _categoryWords!.isNotEmpty;

  static String get getRandomWord {
    final randomIndex = random.nextInt(_words.length);
    final result = _words[randomIndex];
    _words.removeAt(randomIndex);
    return result;
  }
}
