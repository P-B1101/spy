class Word {
  final String category;
  final List<String> words;

  const Word({
    required this.category,
    required this.words,
  });

  factory Word.fromJson(Map<String, dynamic> json) => Word(
        category: json['categoryName'],
        words: () {
          final value = json['words'];
          if (value is! List) return <String>[];
          return value.map((e) => e.toString()).toList();
        }(),
      );
}
