import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:revel_ui/revel_ui.dart';

abstract class RUITheme {
  static final ThemeData themeData = ThemeData(
    useMaterial3: true,
    primaryColor: RUIColors.offWhite,
    textTheme: TextTheme(
      displayLarge: RUITextStyle.displayLarge,
      displayMedium: RUITextStyle.displayMedium,
      displaySmall: RUITextStyle.displaySmall,
      headlineLarge: RUITextStyle.headlineLarge,
      headlineMedium: RUITextStyle.headlineMedium,
      headlineSmall: RUITextStyle.headlineSmall,
      titleLarge: RUITextStyle.titleLarge,
      titleMedium: RUITextStyle.titleMedium,
      titleSmall: RUITextStyle.titleSmall,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: RUIColors.walnutBrown,
        backgroundColor: RUIColors.softPink,
        textStyle: RUITextStyle.titleMedium,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: RUISpacing.xlg,
          vertical: RUISpacing.xlg,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        // foregroundColor: CRXColors.white,
        // disabledBackgroundColor: CRXColors.lightBlue,
        // disabledForegroundColor: CRXColors.lightBlue,
        textStyle: TextStyle(
          fontFamily: GoogleFonts.varelaRound().fontFamily,
          // letterSpacing: 1.5,
          // fontWeight: FontWeight.bold,
          // fontSize: 12,
          color: RUIColors.cocoaBrown,
          // decorationColor: CRXColors.lightBlue,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          // side: const BorderSide(width: 1, color: CRXColors.white),
        ),
        // backgroundColor: CRXColors.black,
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 3),
        minimumSize: const Size(80, 30),
      ),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith(
        (states) => RUIColors.cocoaBrown,
      ),
    ),
    listTileTheme: ListTileThemeData(
      selectedColor: RUIColors.palePink,
      selectedTileColor: RUIColors.palePink,
      tileColor: RUIColors.palePink,
      textColor: RUIColors.cocoaBrown,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(
          color: RUIColors.cocoaBrown,
          width: 2,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (states) => RUIColors.background,
        ),
        textStyle: MaterialStateProperty.resolveWith<TextStyle>(
          (states) => RUITextStyle.displayLarge,
        ),
        padding: MaterialStateProperty.resolveWith<EdgeInsets>(
          (states) => const EdgeInsets.all(RUISpacing.lg),
        ),
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
          (states) => RUIColors.walnutBrown,
        ),
        side: MaterialStateProperty.resolveWith<BorderSide>(
          (states) => const BorderSide(
            color: RUIColors.background,
          ),
        ),
        shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
          (states) => RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        overlayColor: MaterialStateProperty.resolveWith<Color>(
          (states) => RUIColors.palePink,
        ),
        splashFactory: InkSplash.splashFactory,
      ),
    ),
  );
}
