import '../models/user.dart';
import '../services/dio_service.dart';
import '../services/mmkv_service.dart';

class UserRepository {
  final DioService _dioService;
  final MMKVService _mmkvService;

  UserRepository({
    required DioService dioService,
    required MMKVService mmkvService,
  })  : _dioService = dioService,
        _mmkvService = mmkvService;

  Future<List<User>> getUsers() async {
    final response = await _dioService.get('/users');

    if (response.statusCode == 200) {
      final usersJson = response.data as List;
      print('list $usersJson');
      final users = usersJson.map((json) => User.fromJson(json)).toList();
      return users;
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<User?> getUser(int id) async {
    final response = await _dioService.get('/users/$id');

    if (response.statusCode == 200) {
      final userJson = response.data;
      final user = User.fromJson(userJson);
      return user;
    } else {
      throw Exception('Failed to load user');
    }
  }

  Future<void> saveUser(User user) async {
    await _mmkvService.setCacheValue(
        user.id.toString(), user.toJson().toString());
  }

  Future<void> deleteUser(User user) async {
    await _mmkvService.removeCache(user.id.toString());
  }

  Future<List<User>> getFavoriteUsers() async {
    /*   final keys = await _mmkvService.getAllKeys();
    final usersJson = await _mmkvService.getAllStrings(keys: keys);
    final users = usersJson
        .map((json) => User.fromJson(json))
        .where((user) => user.isFavorite)
        .toList();
    return users; */
    return <User>[];
  }
}
