import 'package:flutter/material.dart';
import 'login_page.dart';
import 'dashboard_page.dart';
import 'profile_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
