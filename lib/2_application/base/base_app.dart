import 'package:booktaxi/2_application/base/bloc/app_base_cubit.dart';
import 'package:booktaxi/core/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/theme/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BaseAppProvider extends StatelessWidget {
  const BaseAppProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBaseCubit()..initTheme(),
      child: const BaseApp(),
    );
  }
}

class BaseApp extends StatelessWidget {
  const BaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBaseCubit, AppBaseState>(
      buildWhen: (previous, current) => current is AppBaseLoadedState,
      builder: (context, state) {
        return MaterialApp.router(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          title: 'Book Taxi',
          routerConfig: routes,
          themeMode: state.themeMode,
          theme: customTheme(state),
          darkTheme: customDarkTheme(state),
        );
      },
    );
  }
}
