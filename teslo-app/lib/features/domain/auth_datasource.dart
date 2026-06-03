import 'package:teslo_shop/features/domain/entities/user.dart';

abstract class AuthDatasource {
  Future<User> login(String email, String password);
  Future<User> chechAuthStatus(String token);
}
