import 'package:flutter/material.dart';

import '../controller/game_controller.dart';
import '../controller/word_controller.dart';
import '../model/game.dart';
import '../model/game_config.dart';
import '../utils/utils.dart';
import 'game_widget.dart';
import 'init_game_widget.dart';
import 'timer_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GameController? _controller;

  @override
  void initState() {
    super.initState();
    _handleInitState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _bodyWidget),
    );
  }

  Widget get _bodyWidget => AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        switchInCurve: Curves.easeIn,
        switchOutCurve: Curves.easeOut,
        child: !WordController.isWordsLoaded
            ? const Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : _controller == null
                ? InitGameWidget(onStart: _onStart)
                : ValueListenableBuilder(
                    valueListenable: _controller!,
                    builder: (context, value, child) {
                      if (value.isLastPlayer) {
                        return Center(
                          child: TimerWidget(
                            config: value.getConfig,
                            remain: value.remain,
                            onFinishClick: () {
                              _controller?.finish();
                              setState(() {
                                _controller = null;
                              });
                            },
                            builder: (duration) => SizedBox(
                              width: double.infinity,
                              height: 80,
                              child: AnimatedSwitcher(
                                duration: const Duration(milliseconds: 300),
                                switchInCurve: Curves.easeIn,
                                switchOutCurve: Curves.easeOut,
                                child: Text(
                                  FormatUtils.durationFormat(duration),
                                  key: ValueKey(duration),
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(
                                        fontSize: 32,
                                        fontWeight: FontWeight.w700,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                      return GameWidget(
                        game: value,
                        onShowClick: _controller?.next,
                      );
                    },
                  ),
      );

  void _handleInitState() {
    _loadWords();
  }

  void _loadWords() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await WordController.loadWords();
      setState(() {});
    });
  }

  void _onStart(int playerCount, int spyCount) {
    setState(() {
      _controller = GameController(
        Game(
          GameConfig(
            gamersCount: playerCount,
            spyCount: spyCount,
            word: WordController.getRandomWord,
            durationInMinutes: 3,
          ),
        ),
      );
    });
  }
}
