class FormatUtils {
  const FormatUtils._();

  static durationFormat(Duration duration) =>
      duration.toString().split('.').first.padLeft(8, '0');
}
