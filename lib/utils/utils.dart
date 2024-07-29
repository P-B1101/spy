class FormatUtils {
  const FormatUtils._();

  static durationFormat(Duration time) {
    final duration = Duration(seconds: time.inSeconds);
    final minutes = duration.inMinutes;
    final seconds = time.inSeconds % 60;
    final minutesString = '$minutes'.padLeft(2, '0');
    final secondsString = '$seconds'.padLeft(2, '0');
    return '$minutesString:$secondsString';
  }
}
