import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../home_screen_view_model.dart';
import '../user_list.dart';

class HomeScreenMobile extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeScreenViewModel = ref.watch(homeScreenViewModelProvider);
    homeScreenViewModel.getUsers();
    final userList = homeScreenViewModel.users;

    final users = ref.watch(userListProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('My App Mobile'),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: users.when(
              loading: () => Center(child: CircularProgressIndicator()),
              data: (users) => ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return ListTile(
                    title: Text(user.name),
                    subtitle: Text(user.email),
                    onTap: () =>
                        Navigator.pushNamed(context, '/users/${user.id}'),
                  );
                },
              ),
              error: (error, stackTrace) =>
                  Center(child: Text('Error: $error')),
            ),

            /* UserList(
              users: userList,
            ), */
          ),
        ],
      ),
    );
  }
}
