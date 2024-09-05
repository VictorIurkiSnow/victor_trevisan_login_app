import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';

import 'package:victor_trevisan_login_app/features/login/presentation/common/controller/login_page_controller.dart';
import 'package:victor_trevisan_login_app/features/login/presentation/mobile/login_page_mobile.dart';
import 'package:victor_trevisan_login_app/features/login/presentation/web/login_page_web.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginPageController controller = GetIt.instance<LoginPageController>();

  @override
  Widget build(BuildContext context) {
    return kIsWeb
        ? LoginPageWeb(controller: controller)
        : LoginPageMobile(controller: controller);
  }
}
