import 'package:flutter/material.dart';
import 'package:spy/controller/game_controller.dart';
import 'package:spy/controller/word_controller.dart';
import 'package:spy/json_reader.dart';
import 'package:spy/utils/utils.dart';
import 'package:spy/view/game_widget.dart';
import 'package:spy/view/timer_widget.dart';

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
        child: _controller == null
            ? const Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : ValueListenableBuilder(
                valueListenable: _controller!,
                builder: (context, value, child) {
                  if (value.isLastPlayer) {
                    return TimerWidget(
                      remain: value.duration,
                      builder: (duration) => Text(
                        FormatUtils.durationFormat(duration),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    );
                  }
                  return GameWidget(game: value);
                },
              ),
      );

  void _handleInitState() {
    _loadWords();
  }

  void _loadWords() async {
    final words = await WordController.loadWords();
    setState(() {
      
    });
  }
}
