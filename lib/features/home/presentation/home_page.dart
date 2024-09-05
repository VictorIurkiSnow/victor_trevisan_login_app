import 'package:flutter/material.dart';
import 'package:victor_trevisan_login_app/core/utils/navigation_utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: const Center(
        child: InkWell(
          onTap: NavigationUtils.goLogin,
          child: Text(
            'Home Page',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}
