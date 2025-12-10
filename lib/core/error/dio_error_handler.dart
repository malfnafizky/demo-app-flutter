import 'package:demo_app/core/error/exceptions.dart';
import 'package:dio/dio.dart';

class DioExceptionHandler {
  static ServerException handle(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerException(
          "Connection timeout. Please check your internet connection and try again.",
        );
      case DioExceptionType.sendTimeout:
        return ServerException(
          "Send timeout. The request took too long to send data.",
        );
      case DioExceptionType.receiveTimeout:
        return ServerException(
          "Receive timeout. The request took too long to receive data.",
        );
      case DioExceptionType.badCertificate:
        return ServerException("Bad certificate detected.");
      case DioExceptionType.badResponse:
        final statusCode = dioException.response?.statusCode ?? 0;
        final statusMessage = dioException.response?.statusMessage ?? '';
        final message = dioException.message ?? '';
        return ServerException(
          "Bad response from server: $statusCode $statusMessage\n$message",
        );
      case DioExceptionType.cancel:
        return ServerException("Request was cancelled.");
      case DioExceptionType.connectionError:
        final message = dioException.message ?? 'Unknown connection error';
        return ServerException("Connection error: $message");
      case DioExceptionType.unknown:
        return ServerException(
          dioException.message ?? "Unknown error occurred.",
        );
    }
  }
}
