import 'package:flutter/material.dart';
import 'package:whatsapp_clone/theme/color_theme.dart';


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
        // OptionView( ),
        // Loop options over below component
        _Option(
          maxWidth: maxWidth,
          colorTheme: colorTheme,
          title: '1',
        ),
        _Option(
          maxWidth: maxWidth,
          colorTheme: colorTheme,
          title: '2',
        ),
      ],
    );
  }
}

// class OptionView extends StatelessWidget {
//   const _Option({
//     super.key,
//     required list, required double maxWidth, required ColorTheme colorTheme
//   });



//   final list = ["2", "22", "222"];
//   Widget build(BuildContext context) {
//   final colorTheme = Theme.of(context).custom.colorTheme;

//   final maxWidth = MediaQuery.of(context).size.width * 0.80;
//     return Column(
//       children: list
//           .map((item) => _Option(
//                 maxWidth: maxWidth,
//                 colorTheme: colorTheme,
//                 title: item,
//               ))
//           .toList(),
//     );
//   }
// }

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
