import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:victor_trevisan_login_app/app_get_it.dart';
import 'package:victor_trevisan_login_app/features/home/presentation/common/controller/home_page_controller.dart';
import 'package:victor_trevisan_login_app/features/home/presentation/mobile/home_page_mobile.dart';
import 'package:victor_trevisan_login_app/features/home/presentation/web/home_page_web.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePageController controller = AppGetIt.instance.get<HomePageController>();

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    if (controller.userEntity.value == null) {
      await controller.fetchUserId();
      await controller.fetchUserData();
    }
  }

  @override
  Widget build(BuildContext context) {
     if (kIsWeb) {
      return const HomePageWeb();
    } else {
      return const HomePageMobile();
    }
  }
}
