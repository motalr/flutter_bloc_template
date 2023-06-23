import 'package:booktaxi/2_application/base/bloc/app_base_cubit.dart';
import 'package:booktaxi/core/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'theme_config.dart';

ThemeData customTheme(AppBaseState state) {
  return ThemeData(
    scaffoldBackgroundColor: ThemeConfig.lightThemeBackground,
    fontFamily: ThemeConfig.fontFamily,
    textTheme: textTheme(),
    useMaterial3: true,
    colorScheme: customColorScheme(state),
  );
}

ThemeData customDarkTheme(AppBaseState state) {
  return ThemeData(
    scaffoldBackgroundColor: ThemeConfig.darkThemeBackground,
    fontFamily: ThemeConfig.fontFamily,
    textTheme: darkTextTheme(),
    useMaterial3: true,
    colorScheme: customColorScheme(state),
  );
}

ColorScheme customColorScheme(AppBaseState state) {
  const darkScheme = ColorScheme.dark();
  const lightScheme = ColorScheme.light();
  return ColorScheme(
    brightness: state.themeMode == ThemeMode.dark
        ? darkScheme.brightness
        : lightScheme.brightness,
    primary: ThemeConfig.primaryColor,
    onPrimary: state.themeMode == ThemeMode.dark
        ? darkScheme.onPrimary
        : lightScheme.onPrimary,
    secondary: ThemeConfig.secondaryColor,
    onSecondary: state.themeMode == ThemeMode.dark
        ? darkScheme.onSecondary
        : lightScheme.onSecondary,
    error: ThemeConfig.errorColor,
    onError: state.themeMode == ThemeMode.dark
        ? darkScheme.onError
        : lightScheme.onError,
    background: state.themeMode == ThemeMode.dark
        ? ThemeConfig.darkThemeBackground
        : ThemeConfig.lightThemeBackground,
    onBackground: state.themeMode == ThemeMode.dark
        ? darkScheme.onBackground
        : lightScheme.onBackground,
    surface: state.themeMode == ThemeMode.dark
        ? darkScheme.surface
        : lightScheme.surface,
    onSurface: state.themeMode == ThemeMode.dark
        ? darkScheme.onSurface
        : lightScheme.onSurface,
  );
}
