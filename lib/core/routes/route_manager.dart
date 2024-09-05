import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:victor_trevisan_login_app/core/constants/app_routes.dart';
import 'package:victor_trevisan_login_app/core/page_bases/page_base.dart';
import 'package:victor_trevisan_login_app/features/community/presentation/community_page.dart';
import 'package:victor_trevisan_login_app/features/home/presentation/home_page.dart';
import 'package:victor_trevisan_login_app/features/login/presentation/login_page.dart';

class RouteManager {
  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GlobalKey<NavigatorState> shellNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: AppRoutes.login.path,
    routes: [
      _loginRoute(),
      ShellRoute(
          navigatorKey: shellNavigatorKey,
          builder: (context, state, child) => PageBase(child: child),
          routes: [
            _homeRoute(),
            _communityRoute(),
          ]),
    ],
  );

  static _loginRoute() => GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: AppRoutes.login.path,
        name: AppRoutes.login.name,
        pageBuilder: (context, state) =>
            buildAnimation(state, const LoginPage()),
      );

  static _homeRoute() => GoRoute(
        parentNavigatorKey: shellNavigatorKey,
        path: AppRoutes.home.path,
        name: AppRoutes.home.name,
        pageBuilder: (context, state) =>
            buildAnimation(state, const HomePage()),
      );

  static _communityRoute() => GoRoute(
        parentNavigatorKey: shellNavigatorKey,
        path: AppRoutes.community.path,
        name: AppRoutes.community.name,
        pageBuilder: (context, state) =>
            buildAnimation(state, const CommunityPage()),
      );
}

CustomTransitionPage buildAnimation(GoRouterState state, Widget child) {
  return CustomTransitionPage(
    name: state.fullPath,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
        child: child,
      );
    },
  );
}
