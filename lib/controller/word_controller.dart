import 'dart:convert';

import 'package:spy/json_reader.dart';
import 'package:spy/model/word.dart';

class WordController {
  const WordController._();

  static Future<List<Word>> loadWords() async {
    final data = await JsonReader.loadJsonString('words');
    final items = json.decode(data);
    return items is! List
        ? <Word>[]
        : items.map((e) => Word.fromJson(e)).toList();
  }
}
