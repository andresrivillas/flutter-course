import 'package:riverpod/riverpod.dart';
import 'package:teslo_shop/features/domain/auth_repository.dart';
import 'package:teslo_shop/features/domain/entities/user.dart';
import 'package:teslo_shop/features/infrastructure/auth_datasource_impl.dart';
import 'package:teslo_shop/features/infrastructure/auth_repository_impl.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authRepository = AuthRepositoryImpl();
  return AuthNotifier(authRepository: authRepository);
});

class AuthState {
  final AuthStatus authStatus;
  final User? user;
  final String errorMessage;

  AuthState({
    this.authStatus = AuthStatus.checking,
    this.user,
    this.errorMessage = "",
  });

  AuthState copyWith({
    AuthStatus? authStatus,
    User? user,
    String? errorMessage,
  }) => AuthState(
    authStatus: authStatus ?? this.authStatus,
    user: user ?? this.user,
    errorMessage: errorMessage ?? this.errorMessage,
  );
}

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository authRepository;
  AuthNotifier({required this.authRepository}) : super(AuthState());

  Future<void> loginUser(String email, String password) async {
    try {
      final user = await authRepository.login(email, password);
      _setLoggedUser(user);
    } on WrongCredentials {
      logout("Credenciales incorrectas");
    } catch (e) {
      logout("Error no controlado");
    }
    // final user = await authRepository.login(email, password);
    // state.copyWith(user: user, authStatus: AuthStatus.authenticated);
  }

  void checkAuthStatus() async {}

  void _setLoggedUser(User user) {
    state = state.copyWith(user: user, authStatus: AuthStatus.authenticated);
  }

  Future<void> logout(String? errorMessage) async {
    state = state.copyWith(
      authStatus: AuthStatus.notAuthenticated,
      user: null,
      errorMessage: errorMessage,
    );
  }
}
