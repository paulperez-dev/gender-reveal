import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gender_reveal/app/routes.dart';
import 'package:gender_reveal/l10n/l10n.dart';
import 'package:gender_reveal/presentation/view/presentation.dart';
import 'package:revel_ui/revel_ui.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gender Reveal',
      theme: RUITheme.themeData,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      onUnknownRoute: (settings) => PresentationScreen.route,
      routes: Revel.routes,
    );
  }
}
