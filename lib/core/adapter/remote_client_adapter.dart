import 'package:dio/dio.dart';
import 'package:victor_trevisan_login_app/core/generic/custom_api_exception.dart';
import 'package:victor_trevisan_login_app/core/generic/resource.dart';

abstract class RemoteClientAdapter {
  Future<Resource<Map<String, dynamic>, Exception>> get(
      {required String url, Map<String, dynamic>? body});
  Future<Resource<Map<String, dynamic>, Exception>> post(
      String url, Map<String, dynamic>? body);
  Future<Resource<Map<String, dynamic>, Exception>> put(
      String url, Map<String, dynamic> body);
  Future<Resource<Map<String, dynamic>, Exception>> delete(
      String url, Map<String, dynamic>? body);
}

class RemoteClientAdapterImpl implements RemoteClientAdapter {
  final Dio dio = Dio();

  @override
  Future<Resource<Map<String, dynamic>, Exception>> get(
      {required String url, Map<String, dynamic>? body}) async {
    try {
      final response = await dio.get(url, data: body);
      return _handleResponse(response);
    } catch (e) {
      return _handleError(e);
    }
  }

  @override
  Future<Resource<Map<String, dynamic>, Exception>> post(
      String url, Map<String, dynamic>? body) async {
    try {
      final response = await dio.post(url, data: body);
      return _handleResponse(response);
    } catch (e) {
      return _handleError(e);
    }
  }

  @override
  Future<Resource<Map<String, dynamic>, Exception>> put(
      String url, Map<String, dynamic> body) async {
    try {
      final response = await dio.put(url, data: body);
      return _handleResponse(response);
    } catch (e) {
      return _handleError(e);
    }
  }

  @override
  Future<Resource<Map<String, dynamic>, Exception>> delete(
      String url, Map<String, dynamic>? body) async {
    try {
      final response = await dio.delete(url, data: body);
      return _handleResponse(response);
    } catch (e) {
      return _handleError(e);
    }
  }

  Resource<Map<String, dynamic>, Exception> _handleResponse(Response response) {
    if (response.statusCode != null &&
        response.statusCode! >= 200 &&
        response.statusCode! <= 299) {
      return Resource.success(data: response.data);
    } else {
      return Resource.failed(
          error: CustomApiException(response.statusMessage ?? "Unknown error"));
    }
  }

  Resource<Map<String, dynamic>, Exception> _handleError(Object exception) {
    if (exception is DioException && exception.response != null) {
      final errorMessage = exception.response?.data['error'];
      return Resource.failed(error: CustomApiException(errorMessage));
    } else {
      return Resource.failed(
          error:
              CustomApiException('Request failure: ${exception.toString()}'));
    }
  }
}
