import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onlinics_ui/Navigation.dart';
import 'package:onlinics_ui/domain/AuthService.dart';
import 'package:onlinics_ui/screens/login_screen.dart';

final authServiceProvider = Provider<AuthService>(((ref) => AuthService()));
final authStateStream = StreamProvider<User?>(
  ((ref) {
    return ref.read(authServiceProvider).authStateChange;
  }),
);

class AuthWrapper extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStateStream);
    return user.value != null ? Navigation() : LoginScreen();
  }
}
