import 'package:victor_trevisan_login_app/core/constants/app_routes.dart';
import 'package:victor_trevisan_login_app/core/routes/route_manager.dart';

class NavigationUtils {
  static final nav = RouteManager.router;

  //WEB
  static void  goHome() {
    nav.go(AppRoutes.home.path);
  }

  static void goLogin() {
    nav.go(AppRoutes.login.path);
  }

  static void goCommunity() {
    nav.go(AppRoutes.community.path);
  }

  //MOBILE
  static void pushHome() {
    nav.push(AppRoutes.home.path);
  }

  static void pushLogin() {
    nav.push(AppRoutes.login.path);
  }

  static void pushCommunity() {
    nav.push(AppRoutes.community.path);
  }

  //COMMON
  static void goBack() {
    nav.pop();
  }

  static void pushReplacement(String path) {
    nav.pushReplacement(path);
  }

}
