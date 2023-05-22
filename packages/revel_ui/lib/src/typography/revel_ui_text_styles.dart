import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:revel_ui/revel_ui.dart';

//extension for font weights

abstract class RUITextStyle {
  static TextStyle displayLarge = GoogleFonts.lilyScriptOne(
    color: RUIColors.honeyOrange,
    fontSize: 58,
  );
  static TextStyle displayMedium = GoogleFonts.lilyScriptOne(
    color: RUIColors.walnutBrown,
    fontSize: 36,
  );
  static TextStyle displaySmall = GoogleFonts.lilyScriptOne(
    color: RUIColors.soulBlue,
    fontSize: 32,
  );
  static TextStyle headlineLarge = GoogleFonts.lilyScriptOne(
    color: RUIColors.cocoaBrown,
    fontSize: 24,
  );
  static TextStyle headlineMedium = GoogleFonts.lilyScriptOne(
    color: RUIColors.cocoaBrown,
    fontSize: 20,
  );
  static TextStyle headlineSmall = GoogleFonts.varelaRound(
    color: RUIColors.walnutBrown,
    fontSize: 16,
  );
  static TextStyle titleLarge = GoogleFonts.varelaRound(
    color: RUIColors.walnutBrown,
    fontSize: 24,
  );
  static TextStyle titleMedium = GoogleFonts.varelaRound(
    color: RUIColors.walnutBrown,
    fontSize: 20,
  );
  static TextStyle titleSmall = GoogleFonts.varelaRound(
    color: RUIColors.darkfGreen,
    fontSize: 14,
  );
}
