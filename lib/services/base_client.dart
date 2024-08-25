import 'package:dio/dio.dart' as dio_import;

import '../utils/urls.dart';
import 'shared_pref_helper.dart';

class APIService {
  static final APIService _instance = APIService._initialise();

  APIService._initialise()
      : _dio = dio_import.Dio(dio_import.BaseOptions())
          ..interceptors.add(
            dio_import.LogInterceptor(
              responseBody: true,
              requestBody: true,
              requestHeader: true,
              request: true,
            ),
          );

  factory APIService() => _instance;

  final dio_import.Dio _dio;

  dio_import.Dio get dio => _dio;

  Map<String, String>? createHeaders() {
    String? token = SharedPreferencesManager.getUserId();
    return token != null ? {"Authorization": token} : null;
  }

  Future getDataFromDio({
    required String endPoint,
    Map<String, dynamic>? query,
  }) async =>
      await dio.get(
        baseUrl + endPoint,
        options: dio_import.Options(headers: createHeaders()),
        queryParameters: query,
      );

  Future putDataFromDio({
    required String endPoint,
    dynamic payload,
    Map<String, dynamic>? query,
  }) async {
    String url = baseUrl + endPoint;
    return await dio.put(
      url,
      data: payload,
      options: dio_import.Options(headers: createHeaders()),
      queryParameters: query,
    );
  }

  Future postDataFromDio({
    required String endPoint,
    dynamic payload,
    Map<String, dynamic>? query,
  }) async {
    String url = baseUrl + endPoint;
    return await dio.post(
      url,
      data: payload,
      options: dio_import.Options(headers: createHeaders()),
      queryParameters: query,
    );
  }

  Future postDataDioExternal({
    required String endPoint,
    dynamic payload,
    Map<String, dynamic>? query,
    Map<String, dynamic>? header,
  }) async {
    String url = endPoint;
    return await dio.post(
      url,
      data: payload,
      options: dio_import.Options(headers: header),
      queryParameters: query,
    );
  }
}
