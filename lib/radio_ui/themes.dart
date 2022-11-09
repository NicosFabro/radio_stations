import 'package:flutter/material.dart';
import 'package:radio/radio_ui/radio_ui.dart';

class RadioTheme {
  static ThemeData get dark {
    return ThemeData(
      colorScheme: const ColorScheme.dark(
        primary: RadioColors.teal,
        secondary: RadioColors.lightTeal,
        onPrimary: RadioColors.black,
        onSecondary: RadioColors.black,
        background: RadioColors.black,
        onBackground: RadioColors.beige,
      ),
      scaffoldBackgroundColor: RadioColors.black,
      textTheme: _textTheme,
      appBarTheme: _appBarTheme,
    );
  }

  static TextTheme get _textTheme {
    return TextTheme(
      bodyText1: RadioTextStyles.bodyText1,
      bodyText2: RadioTextStyles.bodyText2,
      headline1: RadioTextStyles.headline1,
      headline2: RadioTextStyles.headline2,
      headline3: RadioTextStyles.headline3,
      headline4: RadioTextStyles.headline4,
      headline5: RadioTextStyles.headline5,
      headline6: RadioTextStyles.headline6,
      button: RadioTextStyles.button,
    );
  }

  static AppBarTheme get _appBarTheme {
    return AppBarTheme(
      color: RadioColors.black,
      centerTitle: true,
      titleTextStyle: RadioTextStyles.bodyText1.copyWith(
        fontWeight: FontWeight.w700,
      ),
      iconTheme: const IconThemeData(color: RadioColors.beige),
    );
  }
}
