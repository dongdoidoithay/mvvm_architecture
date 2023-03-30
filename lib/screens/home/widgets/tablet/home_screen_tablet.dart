import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../home_screen_view_model.dart';
import '../user_list.dart';

class HomeScreenTablet extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeScreenViewModel = ref.watch(homeScreenViewModelProvider);
    final userList = homeScreenViewModel.users;

    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: UserList(
              users: userList,
            ),
          ),
          const Expanded(
            flex: 2,
            child: Center(
              child: Text(
                'Select a user to view details',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
