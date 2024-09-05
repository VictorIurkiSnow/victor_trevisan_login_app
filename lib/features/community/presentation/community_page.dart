import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:victor_trevisan_login_app/features/community/presentation/mobile/community_page_mobile.dart';
import 'package:victor_trevisan_login_app/features/community/presentation/web/community_page_web.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return const CommunityPageWeb();
    } else {
      return const CommunityPageMobile();
    }
  }
}
