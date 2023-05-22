import 'package:flutter/material.dart';
import 'package:revel_ui/revel_ui.dart';

class SmallLoader extends StatelessWidget {
  const SmallLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: RUIColors.honeyOrange,
      ),
    );
  }
}
