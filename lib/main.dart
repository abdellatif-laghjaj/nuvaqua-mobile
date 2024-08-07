import 'package:flutter/material.dart';
import 'package:nuvaqua_mobile/theme/app_theme.dart';

import 'pages/dashboard_page.dart';
import 'pages/login_page.dart';
import 'pages/profile_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nuvaqua',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/dashboard': (context) => DashboardPage(
              userData: ModalRoute.of(context)!.settings.arguments
                  as Map<String, String>,
            ),
        '/profile': (context) => ProfilePage(
              userData: ModalRoute.of(context)!.settings.arguments
                  as Map<String, String>,
            ),
      },
    );
  }
}
