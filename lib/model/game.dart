import 'dart:async';

import 'package:spy/model/game_config.dart';

abstract interface class IGame {
  void next();

  void finish();

  bool get isVisible;

  bool get isLastPlayer;

  Duration get remain;
  
  Duration get duration;
}

class Game implements IGame {
  final GameConfig _config;
  late int _turn;
  Timer? _timer;
  bool _isVisible = false;
  Duration _duration = Duration.zero;
  void Function()? _onTimesUp;

  Game(this._config) {
    _turn = 1;
  }

  @override
  void next() {
    if (!_isVisible) {
      _isVisible = true;
      return;
    }
    if (_turn == 1) _startTimer();
    _isVisible = false;
    if (isLastPlayer) return;
    _turn++;
    return;
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _duration = _duration + const Duration(seconds: 1);
      if (duration >= Duration(minutes: _config.durationInMinutes)) {
        _.cancel();
        _onTimesUp?.call();
      }
    });
  }

  @override
  void finish() {
    _timer?.cancel();
    _timer = null;
    _turn = 1;
    _duration = Duration.zero;
  }

  void setListener(void Function() listener) {
    _onTimesUp = listener;
  }

  @override
  bool get isVisible => _isVisible;

  @override
  bool get isLastPlayer => _turn == _config.gamersCount;

  @override
  Duration get duration => _duration;
  
  @override
  Duration get remain => Duration(minutes: _config.durationInMinutes) - _duration;
}
