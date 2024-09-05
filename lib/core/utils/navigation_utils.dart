import 'package:victor_trevisan_login_app/core/constants/app_routes.dart';
import 'package:victor_trevisan_login_app/core/routes/route_manager.dart';

class NavigationUtils {
  static final nav = RouteManager.router;

  static void goHome() {
    nav.go(AppRoutes.home.path);
  }

  static void goLogin() {
    nav.go(AppRoutes.login.path);
  }

  static void goCommunity() {
    nav.go(AppRoutes.community.path);
  }

  static void goBack() {
    nav.pop();
  }

  static void pushReplacement(String path) {
    nav.pushReplacement(path);
  }
}
