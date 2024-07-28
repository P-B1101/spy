import 'package:flutter/material.dart';
import 'package:spy/model/game.dart';

class GameController extends ValueNotifier<Game> implements IGame {
  final Game _game;
  bool _isDisposed = false;

  GameController(this._game) : super(_game);

  @override
  Duration get duration => _game.duration;

  @override
  Duration get remain => _game.remain;

  @override
  void next() {
    _game.next();
    notifyListeners();
  }

  @override
  void finish() {
    _game.finish();
    notifyListeners();
  }

  @override
  bool get isLastPlayer => _game.isLastPlayer;

  @override
  bool get isVisible => _game.isVisible;

  @override
  void notifyListeners() {
    if (_isDisposed) return;
    super.notifyListeners();
  }

  @override
  void dispose() {
    _game.finish();
    _isDisposed = true;
    super.dispose();
  }
}
