import 'package:riverpod/riverpod.dart';

class AuthState {
  final bool isAuthenticated;
  final String? token;

  AuthState({required this.isAuthenticated, this.token});
}

// Define the initial state
final authStateProvider = StateProvider<AuthState>((ref) {
  return AuthState(isAuthenticated: false, token: null);
});

// Example of managing the authentication state
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(ref.read);
});

class AuthNotifier extends StateNotifier<AuthState> {
  final Reader read;

  AuthNotifier(this.read) : super(AuthState(isAuthenticated: false));

  // Login function
  Future<void> login(String username, String password) async {
    final authApi = read(authApiProvider);
    await authApi.login(username, password);
    state = AuthState(isAuthenticated: true, token: "Token");
  }

  // Logout function
  Future<void> logout() async {
    final authApi = read(authApiProvider);
    await authApi.logout();
    state = AuthState(isAuthenticated: false);
  }
}
