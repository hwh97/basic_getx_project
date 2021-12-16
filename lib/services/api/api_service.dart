import 'package:get/get.dart';

/// ProgressUpdate callback
typedef ProgressUpdate = void Function(int count, int total);

abstract class ApiService extends GetxService {
  /// init methods
  void init({
    required String accessToken,
  });

  /// GET 请求
  Future<dynamic> get(
      String uri,
      Map<String, dynamic> params, {
        Map<String, dynamic>? headers,
        String? contentType,
      });

  /// POST 请求
  Future<dynamic> post(
      String uri,
      dynamic body, {
        ProgressUpdate? progressUpdate,
        Map<String, dynamic>? headers,
        String? contentType,
      });

  /// 设置token
  void setToken(String? token);

  /// 设置proxy
  void setProxy(String proxyIp, String proxyPort);
}
