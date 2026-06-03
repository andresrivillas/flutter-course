import 'package:teslo_shop/features/domain/auth_datasource.dart';
import 'package:teslo_shop/features/domain/auth_repository.dart';
import 'package:teslo_shop/features/domain/entities/user.dart';
import 'package:teslo_shop/features/infrastructure/auth_datasource_impl.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthDatasource dataSource;

  AuthRepositoryImpl([AuthDatasource? dataSource])
    : dataSource = dataSource ?? AuthDatasourceImpl();

  @override
  Future<User> chechAuthStatus(String token) {
    return dataSource.chechAuthStatus(token);
  }

  @override
  Future<User> login(String email, String password) {
    return dataSource.login(email, password);
  }
}
