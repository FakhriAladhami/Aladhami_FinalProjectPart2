import 'package:dio/dio.dart';

class ApiService {
  Dio dio;

  ApiService({required String baseUrl})
      : dio = Dio(BaseOptions(baseUrl: baseUrl));

  /// This is the barebone get method to get the data from the Internet
  Future<dynamic> get(String url) async {
    try {
      final response = await dio.get(url);
      return response.data;
    } catch (e) {
      throw handleError(e);
    }
  }

  Exception handleError(dynamic e) {
    String errorMessage;
    switch (e.type) {
      case DioExceptionType.cancel:
        errorMessage = "Request to API server was cancelled";
        break;
      case DioExceptionType.connectionTimeout:
        errorMessage = "Connection timeout with API server";
        break;
      case DioExceptionType.sendTimeout:
        errorMessage = "Send timeout in connection with API server";
        break;
      case DioExceptionType.receiveTimeout:
        errorMessage = "Receive timeout in connection with API server";
        break;
      case DioExceptionType.badResponse:
        errorMessage =
            "Received invalid status code: ${e.response?.statusCode}";
        break;
      case DioExceptionType.badCertificate:
        errorMessage = "Received invalid certificate";
        break;
      case DioExceptionType.unknown:
        errorMessage = e.message;
        break;
      default:
        errorMessage = "Something went wrong";
        break;
    }

    return Exception(errorMessage);
  }
}
