import 'dart:async';
import 'dart:math';

import 'package:spy/model/game_config.dart';

abstract interface class IGame {
  void next();

  void finish();

  bool get isVisible;

  bool get isLastPlayer;

  Duration get remain;

  Duration get duration;

  String? get getWord;

  bool get isSpyTurn;
}

class Game implements IGame {
  final GameConfig _config;
  late int _turn;
  Timer? _timer;
  bool _isVisible = false;
  Duration _duration = Duration.zero;
  void Function()? _onTimesUp;
  final _random = Random();
  final _spyTurns = List<int>.empty(growable: true);

  Game(this._config) {
    _turn = 1;
    while (_spyTurns.length != _config.spyCount) {
      final temp = _random.nextInt(_config.gamersCount + 1) + 1;
      if (_spyTurns.contains(temp)) continue;
      _spyTurns.add(temp);
    }
  }

  @override
  void next() {
    if (!_isVisible) {
      _isVisible = true;
      return;
    }
    _isVisible = false;
    if (isLastPlayer) {
      _startTimer();
      return;
    }
    _turn++;
    return;
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _duration = _duration + const Duration(seconds: 1);
      if (duration <= Duration(minutes: _config.durationInMinutes)) {
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
    _spyTurns.clear();
  }

  void setListener(void Function() listener) {
    _onTimesUp = listener;
  }

  @override
  bool get isVisible => _isVisible;

  @override
  bool get isLastPlayer => _turn == _config.gamersCount + 1;

  @override
  Duration get duration => _duration;

  @override
  Duration get remain =>
      Duration(minutes: _config.durationInMinutes) - _duration;

  @override
  String? get getWord => _isVisible ? _config.word : null;

  @override
  bool get isSpyTurn => _spyTurns.contains(_turn);

  GameConfig get getConfig => _config;
}
