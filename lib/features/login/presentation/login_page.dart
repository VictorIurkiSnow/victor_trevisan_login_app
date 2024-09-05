import 'package:flutter/material.dart';
import 'package:victor_trevisan_login_app/core/utils/navigation_utils.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Center(
          child: InkWell(
            onTap: () {
              NavigationUtils.goCommunity();
            },
            child: const Text(
              'Login Page',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
