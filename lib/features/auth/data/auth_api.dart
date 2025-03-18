import 'package:food_chooser/core/models/auth/jwt_refresh_token.dart';
import 'package:food_chooser/core/utils/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/network/dio_client.dart';

class AuthApi {
  final DioClient dioClient;
  final SharedPreferencesService sharedPreferencesService;

  AuthApi(this.dioClient, this.sharedPreferencesService);

  // Login function
  Future<void> login(String username, String password) async {
    final response = await dioClient.post<JwtRefreshToken>('auth/login', {
      'username': username,
      'password': password,
    });

    sharedPreferencesService.saveData('access_token', response.accessToken);
    sharedPreferencesService.saveData('refresh_token', response.refreshToken);
    sharedPreferencesService.saveData(
        'expires_in', response.expiresIn.toString());
  }

  // Logout function
  Future<void> logout() async {
    sharedPreferencesService.removeData('access_token');
    sharedPreferencesService.removeData('refresh_token');
    sharedPreferencesService.removeData('expires_in');
  }
}
