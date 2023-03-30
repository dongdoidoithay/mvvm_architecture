import 'package:flutter/material.dart';
import '../data/models/user.dart';
import '../screens/user_details_screen.dart';

class UserList extends StatelessWidget {
  final List<User> users;

  const UserList({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (BuildContext context, int index) {
        final user = users[index];
        debugPrint('user: $user');
        return ListTile(
          leading: CircleAvatar(
            child: Text(user.name.substring(0, 1)),
          ),
          title: Text(user.name),
          subtitle: Text(user.email),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UserDetailsScreen(user: user),
              ),
            );
          },
        );
      },
    );
  }
}
