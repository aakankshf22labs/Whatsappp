import 'package:flutter/material.dart';
import 'package:whatsapp_clone/theme/color_theme.dart';
import 'package:whatsapp_clone/theme/theme.dart';

class OptionSelector extends StatelessWidget {
  const OptionSelector(
      {super.key,
      required this.maxWidth,
      required this.colorTheme,
      required this.options,
      required this.title});

  final double maxWidth;
  final ColorTheme colorTheme;
  final List<String> options;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: maxWidth,
          constraints: const BoxConstraints(
            minHeight: 34,
          ),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8.0),
              topRight: Radius.circular(8.0),
              bottomLeft: Radius.circular(8.0),
              bottomRight: Radius.circular(8.0),
            ),
            color: colorTheme.incomingMessageBubbleColor,
          ),
          padding: const EdgeInsets.all(4),
          child: Text(title),
        ),
        Column(
            children: options
                .map((option) => _Option(
                    maxWidth: maxWidth, colorTheme: colorTheme, title: option))
                .toList())
      ],
    );
  }
}
class _Option extends StatelessWidget {
  const _Option({
    super.key,
    required this.maxWidth,
    required this.colorTheme,
    required this.title,
  });

  final double maxWidth;
  final ColorTheme colorTheme;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        InkWell(
          onTap: () {
            debugPrint(title);
          },
          child: Container(
            width: maxWidth,
            constraints: const BoxConstraints(
              minHeight: 34,
            ),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
                bottomLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0),
              ),
              color: colorTheme.incomingMessageBubbleColor,
            ),
            padding: const EdgeInsets.all(4),
            child: Center(child: Text(title)),
          ),
        )
      ],
    );
  }
}
