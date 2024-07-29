import 'dart:async';

import 'package:flutter/material.dart';
import 'package:spy/model/game_config.dart';

class TimerWidget extends StatefulWidget {
  final Duration remain;
  final Widget Function(Duration remain) builder;
  final GameConfig config;
  final void Function() onFinishClick;
  const TimerWidget({
    super.key,
    required this.remain,
    required this.builder,
    required this.onFinishClick,
    required this.config,
  });

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late var _remain = widget.remain;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void didUpdateWidget(covariant TimerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _remain = oldWidget.remain;
    _startTimer();
  }

  @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 16),
                  widget.builder(_remain),
                  const SizedBox(height: 32),
                  _buttonWidget,
                  const SizedBox(height: 16),
                ],
              ),
            ),
            _infoWidget,
          ],
        ),
      );

  Widget get _infoWidget => Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'تعداد کل بازیکنان: ${widget.config.gamersCount} نفر',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            Text(
              'تعداد جاسوس: ${widget.config.spyCount} نفر',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        ),
      );

  Widget get _buttonWidget => Builder(
        builder: (context) => Container(
          width: double.infinity,
          height: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Theme.of(context).primaryColor,
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: widget.onFinishClick,
              child: Center(
                child: Text(
                  'پایان بازی',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.surface,
                      ),
                ),
              ),
            ),
          ),
        ),
      );

  void _startTimer() {
    _stopTimer();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _remain = _remain - const Duration(seconds: 1);
      if (mounted) setState(() {});
      if (_remain.inSeconds <= 0) _stopTimer();
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }
}
