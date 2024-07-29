import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String hint;
  final FocusNode? nextFocusNode;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final TextAlign textAlign;
  final int? maxLength;
  final bool hasCustomHeight;
  final void Function(String value)? onTextChange;
  final void Function()? onSubmit;
  final Iterable<String>? autofillHint;
  final List<TextInputFormatter>? inputFormatters;
  final String? error;

  const MTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.hint,
    required this.textInputAction,
    required this.textInputType,
    this.textAlign = TextAlign.start,
    this.hasCustomHeight = false,
    this.nextFocusNode,
    this.autofillHint,
    this.maxLength,
    this.onTextChange,
    this.inputFormatters,
    this.error,
    this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: controller,
          focusNode: focusNode,
          onSubmitted: (value) {
            if (nextFocusNode == null) {
              final currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) currentFocus.unfocus();
              return;
            }
            nextFocusNode?.requestFocus();
          },
          autofillHints: autofillHint,
          cursorOpacityAnimates: true,
          expands: hasCustomHeight,
          maxLines: hasCustomHeight ? null : 1,
          textInputAction: textInputAction,
          textAlignVertical: hasCustomHeight
              ? TextAlignVertical.top
              : TextAlignVertical.center,
          onChanged: onTextChange,
          textAlign: textAlign,
          inputFormatters: inputFormatters,
          keyboardType: textInputType,
          onEditingComplete: onSubmit,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xFF0F0F0F),
          ),
          decoration: InputDecoration(
            hintText: hint,
          ),
        ),
        AnimatedCrossFade(
          duration: const Duration(milliseconds: 300),
          sizeCurve: Curves.ease,
          firstCurve: Curves.ease,
          secondCurve: Curves.ease,
          crossFadeState:
              _hasError ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          firstChild: _errorWidget,
          secondChild: const SizedBox(width: double.infinity),
        ),
      ],
    );
  }

  Widget get _errorWidget => Builder(
        builder: (context) => Container(
          width: double.infinity,
          padding: const EdgeInsetsDirectional.only(start: 12, top: 4),
          child: Text(
            error ?? '',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Theme.of(context).colorScheme.error,
                  fontSize: 10,
                ),
          ),
        ),
      );

  bool get _hasError => error != null && error!.isNotEmpty;
}
