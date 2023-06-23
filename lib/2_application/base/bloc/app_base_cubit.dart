import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../1_domain/constants/preference_constants.dart';
import '../../../core/preference.dart';

part 'app_base_state.dart';

class AppBaseCubit extends Cubit<AppBaseState> {
  AppBaseCubit() : super(const AppBaseInitial());

  void initTheme() async {
    final bool isDarkMode = await getThemeMode();
    emit(AppBaseLoadedState(
        themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light));
  }

  void themeChanged(bool isDarkMode) async {
    await setThemeMode(isDarkMode);

    emit(AppBaseLoadedState(
        themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light));
  }
}

Future<bool> getThemeMode() async {
  bool isDarkMode =
      await Preference.instance.get<bool>(PreferenceConstants.isDarkModeKey);
  return isDarkMode;
}

Future<void> setThemeMode(bool isDark) async {
  await Preference.instance
      .set<bool>(PreferenceConstants.isDarkModeKey, isDark);
}
