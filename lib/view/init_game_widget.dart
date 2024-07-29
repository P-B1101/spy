import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spy/view/input_widget.dart';

class InitGameWidget extends StatefulWidget {
  final Function(int playerCount, int spyCount) onStart;
  const InitGameWidget({
    super.key,
    required this.onStart,
  });

  @override
  State<InitGameWidget> createState() => _InitGameWidgetState();
}

class _InitGameWidgetState extends State<InitGameWidget> {
  final _playerCountController = TextEditingController(text: '5');
  final _spyCountController = TextEditingController(text: '1');
  final _playerCountNode = FocusNode();
  final _spyCountNode = FocusNode();
  String? _playerCountError;
  String? _spyCountError;

  @override
  void dispose() {
    _playerCountController.dispose();
    _spyCountController.dispose();
    _playerCountNode.dispose();
    _spyCountNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: FocusTraversalGroup(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) => SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minHeight: constraints.maxHeight),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _playerCountWidget,
                        const SizedBox(height: 24),
                        _spyCountWidget,
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            _startButtonWidget,
          ],
        ),
      ),
    );
  }

  Widget get _playerCountWidget => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 12, bottom: 8),
            child: Text(
              'تعداد کل بازیکنان',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          MTextField(
            controller: _playerCountController,
            focusNode: _playerCountNode,
            nextFocusNode: _spyCountNode,
            hint: 'تعداد کل بازیکنان را وارد نمایید',
            textInputAction: TextInputAction.next,
            textInputType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            error: _playerCountError,
            textAlign: TextAlign.center,
            onTextChange: (value) {
              if (value.isNotEmpty && _playerCountError != null) {
                setState(() {
                  _playerCountError = null;
                });
              }
            },
          ),
        ],
      );

  Widget get _spyCountWidget => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 12, bottom: 8),
            child: Text(
              'تعداد جاسوس',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          MTextField(
            controller: _spyCountController,
            focusNode: _spyCountNode,
            hint: 'تعداد جاسوس را وارد نمایید',
            textInputAction: TextInputAction.done,
            textInputType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            error: _spyCountError,
            textAlign: TextAlign.center,
            onSubmit: _onStartClick,
            onTextChange: (value) {
              if (value.isNotEmpty && _spyCountError != null) {
                setState(() {
                  _spyCountError = null;
                });
              }
            },
          ),
        ],
      );

  Widget get _startButtonWidget => Container(
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
            onTap: _onStartClick,
            child: Center(
              child: Text(
                'شروع بازی',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.surface,
                    ),
              ),
            ),
          ),
        ),
      );

  void _onStartClick() {
    final playerCount = int.tryParse(_playerCountController.text);
    final spyCount = int.tryParse(_spyCountController.text);
    if (playerCount == null) {
      setState(() {
        _playerCountError = 'تعداد کل بازیکنان را وارد نمایید!';
      });
      return;
    }
    if (spyCount == null) {
      setState(() {
        _spyCountError = 'تعداد جاسوس را وارد نمایید!';
      });
      return;
    }

    if (spyCount >= (playerCount - spyCount)) {
      setState(() {
        _spyCountError = 'تعداد جاسوس باید کمتر از تعداد بازیکنان عادی باشد!';
      });
      return;
    }
    widget.onStart(playerCount, spyCount);
  }
}
