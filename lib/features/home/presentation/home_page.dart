import 'package:flutter/material.dart';
import 'package:victor_trevisan_login_app/core/constants/app_colors.dart';
import 'package:victor_trevisan_login_app/core/generic/app_scroll_and_expanded.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScrollAndExpanded(
        child: Container(
      color: AppColors.lightGrey,
    ));
  }
}
