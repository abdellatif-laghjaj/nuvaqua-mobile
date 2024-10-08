import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  final Map<String, String> userData;

  ProfileTab({required this.userData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'اسم المستخدم: ${userData['username']}',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16.0),
          Text(
            'البريد الإلكتروني: ${userData['email']}',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}
