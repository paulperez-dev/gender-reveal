import 'package:flutter/material.dart';
import 'package:revel_ui/revel_ui.dart';

class RUIRadioListTile extends StatelessWidget {
  const RUIRadioListTile({
    Key? key,
    required this.label,
    required this.correctAnswerMessage,
    required this.currentValue,
    required this.selectedAnswer,
    required this.hasResponded,
    required this.isCorrectAnswer,
    required this.onChanged,
    this.padding = const EdgeInsets.all(RUISpacing.sm),
  }) : super(key: key);

  final String label;
  final String correctAnswerMessage;
  final String currentValue;
  final String selectedAnswer;
  final bool hasResponded;
  final bool isCorrectAnswer;
  final ValueChanged<String> onChanged;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(currentValue),
      child: AnimatedContainer(
        padding: padding,
        decoration: _decoration(),
        duration: const Duration(milliseconds: 150),
        child: Row(
          children: <Widget>[
            Radio<bool>(
              groupValue: true,
              value: selectedAnswer == currentValue,
              onChanged: null,
            ),
            Text(
              label,
              style: RUITextStyle.titleMedium,
            ),
            const Spacer(),
            if (hasResponded &&
                isCorrectAnswer &&
                currentValue == selectedAnswer)
              Text(
                correctAnswerMessage,
                style: RUITextStyle.titleSmall,
              )
          ],
        ),
      ),
    );
  }

  BoxDecoration _decoration() {
    if (hasResponded && currentValue == selectedAnswer) {
      if (isCorrectAnswer) {
        return BoxDecoration(
          border: Border.all(color: RUIColors.leafGreen),
          borderRadius: BorderRadius.circular(10),
          color: RUIColors.leafGreen.withOpacity(0.3),
        );
      }
      return BoxDecoration(
        border: Border.all(color: RUIColors.vividRed),
        borderRadius: BorderRadius.circular(10),
        color: RUIColors.vividRed.withOpacity(0.3),
      );
    }
    if (currentValue == selectedAnswer) {
      return BoxDecoration(
        border: Border.all(color: RUIColors.cocoaBrown),
        borderRadius: BorderRadius.circular(10),
        color: RUIColors.palePink,
      );
    }
    return const BoxDecoration();
  }
}
