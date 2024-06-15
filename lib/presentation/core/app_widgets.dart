import 'package:flutter/material.dart';
import 'package:conoce_beta/configuration/theme/app_theme.dart';
import 'package:conoce_beta/configuration/router/app_router.dart';

class AppWidget extends StatelessWidget {
  AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'conoce maracaibo',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme.getThemeData(),
    );
  }
}
