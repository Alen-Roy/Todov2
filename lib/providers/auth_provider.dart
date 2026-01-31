import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../repositories/auth_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepository(),
);

final authStateProvider =
    StateNotifierProvider<AuthNotifier, AsyncValue<User?>>((ref) {
      final repo = ref.read(authRepositoryProvider);
      return AuthNotifier(repo);
    });

class AuthNotifier extends StateNotifier<AsyncValue<User?>> {
  final AuthRepository _repo;
  AuthNotifier(this._repo) : super(const AsyncValue.loading()) {
    _repo.authStatechanges().listen(
      (user) {
        state = AsyncValue.data(user);
      },
      onError: (e, st) {
        state = AsyncValue.error(e, st);
      },
    );
  }

  Future<User?> signIn(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      final user = await _repo.signIn(email, password);
      state = AsyncValue.data(user);
      return user;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }

  Future<User?> register(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      final user = await _repo.register(email, password);
      state = AsyncValue.data(user);
      return user;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }

  Future<void> signOut() async {
    await _repo.signOut();
  }
}
