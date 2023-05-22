import 'package:flutter/material.dart';
import 'package:revel_ui/revel_ui.dart';

class RUIImageBackground extends StatelessWidget {
  const RUIImageBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        DecoratedBox(decoration: BoxDecoration(color: RUIColors.background)),
        SizedBox.expand(
          child: Opacity(
            opacity: 0.5,
            child: Image(
              fit: BoxFit.scaleDown,
              repeat: ImageRepeat.repeat,
              image: AssetImage(
                'assets/images/background.jpg',
                package: 'revel_ui',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
