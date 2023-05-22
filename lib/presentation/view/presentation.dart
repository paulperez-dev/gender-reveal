import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gender_reveal/constants/constants.dart';
import 'package:gender_reveal/extensions/extensions.dart';
import 'package:gender_reveal/home/view/home_screen.dart';
import 'package:gender_reveal/l10n/l10n.dart';
import 'package:gender_reveal/presentation/bloc/presentation_bloc.dart';
import 'package:revel_ui/revel_ui.dart';

class PresentationScreen extends StatelessWidget {
  const PresentationScreen({super.key});

  static final route = MaterialPageRoute<void>(
    builder: (context) => BlocProvider(
      create: (_) {
        final precacheImages = [
          context.precacheImage(
            const AssetImage(kImagePearl, package: kPackage),
          ),
          context.precacheImage(
            const AssetImage(kImageBabies, package: kPackage),
          ),
          context.precacheImage(
            const AssetImage(kImageImABoy, package: kPackage),
          ),
          context.precacheImage(
            const AssetImage(kImagePearlBoy, package: kPackage),
          ),
          context.precacheImage(
            const AssetImage(kImagePearlGirl, package: kPackage),
          ),
          context.precacheImage(
            const AssetImage(kImageLittleBoy, package: kPackage),
          ),
          context.precacheImage(
            const AssetImage(kImageBackground, package: kPackage),
          ),
          context.precacheImage(
            const AssetImage(kImageLineVertical, package: kPackage),
          ),
          context.precacheImage(
            const AssetImage(kImageLineDiagonal, package: kPackage),
          ),
          context.precacheImage(
            const AssetImage(kImageBabySonography, package: kPackage),
          ),
          context.precacheImage(
            const AssetImage(kImageLineHorizontal, package: kPackage),
          ),
        ];

        return PresentationBloc()..add(PrecacheImagesEvent(precacheImages));
      },
      child: const PresentationScreen(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final textGroup = AutoSizeGroup();
    final l10n = context.l10n;

    return Scaffold(
      body: BlocBuilder<PresentationBloc, PresentationState>(
        builder: (context, state) {
          if (state.status.isLoading) {
            return const SmallLoader();
          }
          return Stack(
            children: [
              const RUIImageBackground(),
              SingleChildScrollView(
                child: RUICard(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AutoSizeText(
                        l10n.welcomeTitle,
                        style: context.textTheme.displayLarge,
                        maxLines: 1,
                      ),
                      const SizedBox(height: RUISpacing.xlg),
                      AutoSizeText(
                        l10n.welcomeBody1,
                        style: RUITextStyle.headlineMedium,
                        textAlign: TextAlign.center,
                        group: textGroup,
                      ),
                      const RUIBabiesImage(),
                      AutoSizeText(
                        l10n.welcomeBody2,
                        style: context.textTheme.headlineMedium,
                        textAlign: TextAlign.center,
                        group: textGroup,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: RUISpacing.xxlg,
                          bottom: RUISpacing.xlg,
                        ),
                        child: ElevatedButton(
                          child: Text(l10n.buttonLetsPlay),
                          onPressed: () => context.navigator.pushReplacement(
                            HomeScreen.route,
                          ),
                        ),
                      ),
                      // * This is to preload the emoticons and avoid the empty
                      // * boxes on the related question.
                      const Opacity(
                        opacity: 0,
                        child: Text(
                          kPreloadIcons,
                          style: TextStyle(fontSize: 1),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
