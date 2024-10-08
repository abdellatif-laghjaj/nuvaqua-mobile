import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nuvaqua_mobile/pages/tabs/profile_tab.dart';
import 'package:nuvaqua_mobile/theme/app_theme.dart';

import 'pages/dashboard_page.dart';
import 'pages/login_page.dart';

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
      themeMode: ThemeMode.system,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/dashboard': (context) => DashboardPage(
              userData: ModalRoute.of(context)!.settings.arguments
                  as Map<String, String>,
            ),
        '/profile': (context) => ProfileTab(
            userData: ModalRoute.of(context)!.settings.arguments
                as Map<String, String>)
      },
      // Set the default locale to Arabic
      locale: const Locale('ar', ''),
      // Add support for Arabic localization
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // Specify the supported locales
      supportedLocales: const [
        Locale('ar', ''),
        Locale('en', ''),
      ],
    );
  }
}
