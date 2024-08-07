import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final Map<String, String> userData;

  ProfilePage({required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Username: ${userData['username']}'),
            SizedBox(height: 10), // Add spacing between text elements
            Text('Email: ${userData['email']}'),
          ],
        ),
      ),
    );
  }
}
