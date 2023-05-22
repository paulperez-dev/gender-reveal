import 'package:flutter/material.dart';

class RUIImBoy extends StatelessWidget {
  const RUIImBoy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/im_a_boy.png',
      package: 'revel_ui',
    );
  }
}
