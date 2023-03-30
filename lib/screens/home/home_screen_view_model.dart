import 'package:flutter/material.dart';

import '../../data/models/user.dart';
import '../../data/provider/user_repository_provider.dart';
import '../../data/repositories/user_repository.dart';
import 'package:riverpod/riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeScreenViewModelProvider =
    ChangeNotifierProvider.autoDispose<HomeScreenViewModel>((ref) {
  final userRepository = ref.watch(userRepositoryProvider);
  return HomeScreenViewModel(userRepository: userRepository);
});
final userListProvider = FutureProvider<List<User>>((ref) async {
  final userRepository = ref.watch(userRepositoryProvider);
  final users = await userRepository.getUsers();
  return users;
});

class HomeScreenViewModel extends ChangeNotifier {
  final UserRepository userRepository;
  HomeScreenViewModel({required this.userRepository});

  List<User> _users = [];
  List<User> get users => _users;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getUsers() async {
    _isLoading = true;
    //notifyListeners();
    try {
      _users = await userRepository.getUsers();
    } catch (e) {
      print(e.toString());
    }
    _isLoading = false;
    notifyListeners();
  }
}
