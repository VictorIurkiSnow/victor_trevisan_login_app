import 'package:flutter/material.dart';
import 'package:victor_trevisan_login_app/core/utils/navigation_utils.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: const Center(
        child: InkWell(
          onTap: NavigationUtils.goHome,
          child: Text(
            'Community Page',
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
