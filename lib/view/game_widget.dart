import 'package:flutter/material.dart';
import 'package:spy/model/game.dart';

class GameWidget extends StatelessWidget {
  final Game game;
  final void Function()? onShowClick;
  const GameWidget({
    super.key,
    required this.game,
    required this.onShowClick,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            _textWidget,
            const SizedBox(height: 32),
            _buttonWidget,
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget get _textWidget => Builder(
        builder: (context) => Container(
          height: 80,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(56),
            color: Theme.of(context).secondaryHeaderColor,
          ),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            switchInCurve: Curves.easeIn,
            switchOutCurve: Curves.easeOut,
            child: !game.isVisible
                ? Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(text: 'برای نمایش کلمه روی '),
                        TextSpan(
                            text: '"نمایش کلمه"',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                )),
                        const TextSpan(text: ' کلیک کنید'),
                      ],
                    ),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium,
                  )
                : Text(
                    game.isSpyTurn ? 'شما جاسوس هستید' : game.getWord ?? '',
                    key: ValueKey(game.isVisible),
                    textAlign: TextAlign.center,
                    style: game.isVisible
                        ? Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            )
                        : Theme.of(context).textTheme.titleMedium,
                  ),
          ),
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
              onTap: onShowClick,
              child: Center(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  switchInCurve: Curves.easeIn,
                  switchOutCurve: Curves.easeOut,
                  child: Text(
                    game.isVisible ? 'دیدم' : 'نمایش کلمه',
                    key: ValueKey(game.isVisible),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.surface,
                        ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
