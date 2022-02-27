import 'dart:async';

/// {@template authentication_repository}
/// for managing authentication domain
/// {@endtemplate}
///
///
///
/// enum for authentication status
enum AuthenticationStatus { unknown, authenticated, unAuthenticated }

class AuthenticationRepository {
  final controller = StreamController<AuthenticationStatus>();

  /// This exposes a stream of AuthenticationStatus of the user which will be
  /// used to notify the application once the user logs in or out
  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unAuthenticated;
    yield* controller.stream;
  }

  /// Logs in a user with email and password.
  Future<void> login(
      {required String username, required String password}) async {
    await Future.delayed(
      const Duration(milliseconds: 300),
      () => controller.add(AuthenticationStatus.authenticated),
    );
  }

  /// logs out the user
  void logout() {
    controller.add(AuthenticationStatus.unAuthenticated);
  }

  void dispose() => controller.close();
}
