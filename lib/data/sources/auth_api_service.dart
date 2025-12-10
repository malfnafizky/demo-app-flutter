import 'package:demo_app/core/constans/app_urls.dart';
import 'package:demo_app/core/error/dio_error_handler.dart';
import 'package:demo_app/core/error/exceptions.dart';
import 'package:demo_app/core/network/dio_client.dart';
import 'package:demo_app/data/models/user_model.dart';
import 'package:demo_app/service_locator.dart';
import 'package:dio/dio.dart';

abstract interface class AuthApiService {
  Future<UserModel> signIn({
    required String username,
    required String password,
  });
}

class AuthApiServiceImpl implements AuthApiService {
  final DioClient _dioClient = sl<DioClient>();

  @override
  Future<UserModel> signIn({
    required String username,
    required String password,
  }) async {
    try {
      print('[SignIn - ValueCheck] username : ${username}');
      print('[SignIn - ValueCheck] password : ${password}');

      final response = await _dioClient.post(
        ApiUrls.signIn,
        data: {'username': username, 'password': password},
      );

      if (response.data == null || response.statusCode != 200) {
        throw ServerException('Invalid credentials');
      }

      return UserModel.fromJson(response.data);
    } on DioException catch (dioError) {
      throw DioExceptionHandler.handle(dioError);
    } catch (e) {
      throw ServerException("Unexpected error: $e");
    }
  }
}
