import 'package:flutter/services.dart';

final class JsonReader {
  const JsonReader._();

  static Future<String> loadJsonString(String name) =>
      rootBundle.loadString('assets/json/$name.json');
}
