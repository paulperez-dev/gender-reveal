import 'package:flutter/material.dart';
import 'package:revel_ui/revel_ui.dart';

class RUIBabiesImage extends StatelessWidget {
  const RUIBabiesImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: RUISpacing.lg),
      child: Image.asset(
        'assets/images/babies.png',
        package: 'revel_ui',
      ),
    );
  }
}
