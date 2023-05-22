import 'package:flutter/material.dart';
import 'package:gender_reveal/l10n/l10n.dart';
import 'package:revel_ui/revel_ui.dart';

class EcoScreen extends StatelessWidget {
  const EcoScreen({super.key});

  static const routeName = '/eco_screen';
  static final route = MaterialPageRoute<void>(
    builder: (context) => const EcoScreen(),
  );

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          const RUIImageBackground(),
          RUIEco(
            babyName: Text(
              l10n.revelationBabyName,
              style: RUITextStyle.displaySmall.copyWith(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
