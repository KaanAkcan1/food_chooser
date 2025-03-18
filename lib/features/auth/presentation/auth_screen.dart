import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import '../domain/auth_state.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        // authState'i widget'ı build ederken okuyalım.
        final authState = ref.watch(authStateProvider);

        return Scaffold(
          appBar: AppBar(title: Text("Authentication")),
          body: Center(
            child: authState.isAuthenticated
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Welcome, ${authState.token}'),
                      ElevatedButton(
                        onPressed: () {
                          ref.read(authProvider.notifier).logout();
                        },
                        child: Text('Logout'),
                      ),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          ref
                              .read(authProvider.notifier)
                              .login('username', 'password');
                        },
                        child: Text('Login'),
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
