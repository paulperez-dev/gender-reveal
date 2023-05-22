import 'package:flutter/material.dart';

import '../../revel_ui.dart';

class RUIEco extends StatelessWidget {
  const RUIEco({Key? key, required this.babyName}) : super(key: key);

  final Widget babyName;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Image.asset(
            'assets/images/lucas.png',
            package: 'revel_ui',
            width: 300,
          ),
          babyName,
          Padding(
            padding: const EdgeInsets.symmetric(vertical: RUISpacing.sm),
            child: Image.asset(
              'assets/images/little_boy.png',
              package: 'revel_ui',
              width: 300,
            ),
          ),
        ],
      ),
    );
  }
}
