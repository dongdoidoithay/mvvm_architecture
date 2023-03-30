import 'package:flutter/material.dart';
import '../data/models/user.dart';

class UserDetailsScreen extends StatelessWidget {
  final User user;

  const UserDetailsScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Name:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(user.name),
            const SizedBox(height: 16),
            const Text(
              'Email:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(user.email),
          ],
        ),
      ),
    );
  }
}
