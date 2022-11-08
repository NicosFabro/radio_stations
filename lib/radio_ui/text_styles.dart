import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:radio/radio_ui/radio_ui.dart';

class RadioTextStyles {
  static final _baseTextStyle = GoogleFonts.raleway(
    color: RadioColors.beige,
    fontWeight: FontWeight.normal,
  );

  static TextStyle get bodyText1 {
    return _baseTextStyle.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.normal,
    );
  }

  static TextStyle get bodyText2 {
    return _baseTextStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.normal,
    );
  }

  /// Headline 1 Text Style
  static TextStyle get headline1 {
    return _baseTextStyle.copyWith(
      fontSize: 56,
      fontWeight: FontWeight.bold,
    );
  }

  /// Headline 2 Text Style
  static TextStyle get headline2 {
    return _baseTextStyle.copyWith(
      fontSize: 30,
      fontWeight: FontWeight.w400,
    );
  }

  /// Headline 3 Text Style
  static TextStyle get headline3 {
    return _baseTextStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w400,
    );
  }

  /// Headline 4 Text Style
  static TextStyle get headline4 {
    return _baseTextStyle.copyWith(
      fontSize: 22,
      fontWeight: FontWeight.bold,
    );
  }

  /// Headline 5 Text Style
  static TextStyle get headline5 {
    return _baseTextStyle.copyWith(
      fontSize: 22,
      fontWeight: FontWeight.w500,
    );
  }

  /// Headline 6 Text Style
  static TextStyle get headline6 {
    return _baseTextStyle.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle get button {
    return _baseTextStyle.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w900,
    );
  }
}
