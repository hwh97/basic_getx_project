import 'package:basic_getx_project/constant/app_constants.dart';
import 'package:basic_getx_project/exceptions/network_exception.dart';
import 'package:basic_getx_project/services/api/api_service.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class ApiServiceImpl extends ApiService {
  final _dio = Dio();

  ApiServiceImpl() {
    _dio.options.connectTimeout = AppConstants.requestConnectTimeout;
    _dio.options.receiveTimeout = AppConstants.requestReceiveTimeout;
  }

  @override
  void init({required String accessToken}) {
    setToken(accessToken);
    _dio.options.baseUrl = AppConstants.requestBasicUrl;
    _dio.interceptors.add(LogInterceptor(responseBody: true));
  }

  @override
  Future get(String uri, Map<String, dynamic> params, {Map<String, dynamic>? headers, String? contentType}) async {
    Response response;
    try {
      response = await _dio.get(
        uri,
        queryParameters: params,
        options: headers == null && contentType == null
            ? null
            : Options(
          headers: headers ?? _dio.options.headers,
          contentType: contentType ?? _dio.options.contentType,
        ),
      );
    } on DioError catch (e) {
      throw NetworkException(e.message);
    }

    return response.data;
  }

  @override
  Future post(String uri, body, {ProgressUpdate? progressUpdate, Map<String, dynamic>? headers, String? contentType}) async {
    Response response;
    try {
      response = await _dio.post(
        uri,
        data: body,
        onSendProgress: progressUpdate,
        options: headers == null && contentType == null
            ? null
            : Options(
          headers: headers ?? _dio.options.headers,
          contentType: contentType ?? _dio.options.contentType,
        ),
      );
    } on DioError catch (e) {
      throw NetworkException(e.message);
    }

    return response.data;
  }

  @override
  void setProxy(String proxyIp, String proxyPort) {
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.findProxy = (uri) {
        return 'PROXY $proxyIp:$proxyPort';
      };
      return client;
    };
  }

  @override
  void setToken(String? token) {
    if (token == null) {
      _dio.options.headers.remove(AppConstants.requestTokenKey);
      return;
    }
    _dio.options.headers = {AppConstants.requestTokenKey: token};
  }
}