import 'package:flutter/material.dart';
import 'package:gender_reveal/eco_screen/eco_screen.dart';
import 'package:gender_reveal/extensions/extensions.dart';
import 'package:gender_reveal/l10n/l10n.dart';
import 'package:revel_ui/revel_ui.dart';

class RevealScreen extends StatelessWidget {
  const RevealScreen({super.key});

  static const routeName = '/reveal_screen';
  static final route = MaterialPageRoute<void>(
    builder: (context) => const RevealScreen(),
  );

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          const RUIImageBackground(),
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RUICard(
                  child: Column(
                    children: [
                      const RUIImBoy(),
                      Padding(
                        padding: const EdgeInsets.only(top: RUISpacing.sm),
                        child: Text(
                          l10n.revelationMyNameIs,
                          style: context.textTheme.titleMedium,
                        ),
                      ),
                      Text(
                        l10n.revelationBabyName,
                        style: context.textTheme.displaySmall,
                      ),
                    ],
                  ),
                ),
                RUICard(
                  margin: EdgeInsets.zero,
                  color: RUIColors.softPink,
                  child: Column(
                    children: [
                      Text(
                        l10n.revelationYouDidIt,
                        textAlign: TextAlign.center,
                        style: context.textTheme.titleMedium,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: RUISpacing.xlg,
                        ),
                        child: Text(
                          l10n.revelationThanksForPlaying,
                          textAlign: TextAlign.center,
                          style: context.textTheme.headlineLarge,
                        ),
                      ),
                      Text(
                        l10n.revelationMessage,
                        textAlign: TextAlign.center,
                        style: context.textTheme.titleMedium!
                            .copyWith(height: 1.2),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: RUISpacing.xlg,
                        ),
                        child: Text(
                          l10n.revelationSeeYou,
                          textAlign: TextAlign.center,
                          style: context.textTheme.headlineLarge,
                        ),
                      ),
                      ElevatedButton(
                        style:
                            context.theme.elevatedButtonTheme.style!.copyWith(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (states) => RUIColors.background,
                          ),
                        ),
                        onPressed: () =>
                            context.navigator.push(EcoScreen.route),
                        child: Text(
                          l10n.revelationSonographyButton,
                          textAlign: TextAlign.center,
                          style: context.textTheme.titleMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
