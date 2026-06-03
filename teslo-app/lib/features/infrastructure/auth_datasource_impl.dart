import 'package:dio/dio.dart';
import 'package:teslo_shop/config/constants/environment.dart';
import 'package:teslo_shop/features/domain/auth_datasource.dart';
import 'package:teslo_shop/features/domain/entities/user.dart';

class AuthDatasourceImpl extends AuthDatasource {
  final dio = Dio(BaseOptions(baseUrl: Environment.apiUrl));
  @override
  Future<User> chechAuthStatus(String token) {
    // TODO: implement chechAuthStatus
    throw UnimplementedError();
  }

  @override
  Future<User> login(String email, String password) async {
    try {
      final response = await dio.post(
        '/auth/login',
        data: {"email": email, "password": password},
      );
      return UserMapper.userJsonToEntity(response.data);
    } catch (e) {
      throw WrongCredentials();
    }
  }
}

class WrongCredentials implements Exception {}

class InvalidToken implements Exception {}

class UserMapper {
  static User userJsonToEntity(Map<String, dynamic> json) => User(
    id: json['id'],
    email: json['email'],
    fullName: json['fullName'],
    roles: List<String>.from(json['roles'].map((role) => role)),
    token: json['token'],
  );
}
