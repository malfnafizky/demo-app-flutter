import 'package:demo_app/core/constans/app_urls.dart';
import 'package:demo_app/core/error/dio_error_handler.dart';
import 'package:demo_app/core/error/exceptions.dart';
import 'package:demo_app/core/network/dio_client.dart';
import 'package:dio/dio.dart';

abstract interface class AuthApiDataSource {
  Future<Map<String, dynamic>> signIn({
    required String username,
    required String password,
  });

  Future<Response> currentUser({required String accessToken});
}

class AuthApiDataSourceImpl implements AuthApiDataSource {
  final DioClient dioClient;
  AuthApiDataSourceImpl(this.dioClient);

  @override
  Future<Map<String, dynamic>> signIn({
    required String username,
    required String password,
  }) async {
    try {
      final response = await dioClient.post(
        ApiUrls.signIn,
        data: {'username': username, 'password': password},
      );

      if (response.data == null || response.statusCode != 200) {
        throw ServerException('Invalid credentials');
      }

      return response.data;
    } on DioException catch (dioError) {
      throw DioExceptionHandler.handle(dioError);
    } catch (e) {
      throw ServerException("Unexpected error: $e");
    }
  }

  @override
  Future<Response> currentUser({required String accessToken}) async {
    try {
      final response = await dioClient.get(
        ApiUrls.currentUser,
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );

      return response;
    } on DioException catch (dioError) {
      throw DioExceptionHandler.handle(dioError);
    } catch (e) {
      throw ServerException("Unexpected error: $e");
    }
  }
}
