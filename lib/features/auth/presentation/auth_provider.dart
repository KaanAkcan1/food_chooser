
import 'package:riverpod/riverpod.dart';

import '../../../core/network/dio_client.dart';
import '../data/auth_api.dart';

final dioClientProvider = Provider<DioClient>((ref) {
  final dio = Dio();
  final prefs = ref.read(sharedPreferencesProvider);
  final dioClient = DioClient(dio, prefs);
  dioClient.addInterceptors();
  return dioClient;
});

// Define the provider for AuthApi
final authApiProvider = Provider<AuthApi>((ref) {
  final dioClient = ref.read(dioClientProvider);
  return AuthApi(dioClient);
});
