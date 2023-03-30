import 'package:dio/dio.dart';
import '../services/dio_service.dart';
import '../services/mmkv_service.dart';
import '../repositories/user_repository.dart';
import 'package:riverpod/riverpod.dart';

final dioProvider = Provider<Dio>((ref) => Dio());

final dioServiceProvider = Provider<DioService>((ref) {
  //final dio = ref.watch(dioProvider);
  //return DioService(dio: dio);
  return DioService();
});

final mmkvProvider = Provider<MMKVService>((ref) => MMKVService());

final userRepositoryProvider = Provider<UserRepository>((ref) {
  final dioService = ref.watch(dioServiceProvider);
  final mmkvService = ref.watch(mmkvProvider);
  return UserRepository(dioService: dioService, mmkvService: mmkvService);
});
