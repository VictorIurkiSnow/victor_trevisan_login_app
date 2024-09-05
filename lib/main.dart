import 'package:flutter/material.dart';
import 'package:victor_trevisan_login_app/app_get_it.dart';
import 'package:victor_trevisan_login_app/core/routes/route_manager.dart';

void main() {
  AppGetIt.setUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Tecnofit Login App',
      theme: ThemeData(
        fontFamily: 'Nunito',
        useMaterial3: true,
      ),
      routerConfig: RouteManager.router,
    );
  }
}
