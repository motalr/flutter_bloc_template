import 'package:booktaxi/2_application/features/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final routes = GoRouter(
  routes: [
    GoRoute(
      path: '/${LoginPage.pageConfig.name}',
      name: LoginPage.pageConfig.name,
      builder: (context, state) => const LoginPageProvider(),
    )
  ],
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/${LoginPage.pageConfig.name}',
);
