import 'dart:convert';
import 'package:http/http.dart' as http;
import '../services/shared_pref_helper.dart';
import '../utils/urls.dart';

class APIService {
  String token = SharedPreferencesManager.getUserId().toString();

  Map<String, String> createHeaders(isRegistration) => {"Authorization": token};

  Future getData(
      {required String endPoint,
      Map<String, dynamic>? query,
      bool isRegistration = false}) async {
    Uri tempUri = Uri.parse(baseUrl + endPoint);
    var uri = Uri(
      scheme: tempUri.scheme,
      port: tempUri.port,
      host: tempUri.host,
      path: tempUri.path,
      queryParameters: query ?? {},
    );
    return await http.get(uri, headers: createHeaders(isRegistration));
  }

  Future postData({
    required String endPoint,
    dynamic payload,
    bool isRegistration = false,
  }) async =>
      await http.post(Uri.parse("http://localhost:5001/auth/register"),
          body: payload);

  Future putData({
    required String endPoint,
    dynamic payload,
    bool isRegistration = false,
  }) async =>
      await http.put(Uri.parse(baseUrl + endPoint),
          headers: createHeaders(isRegistration), body: payload);

  Future putDataImage({
    required String presigned,
    dynamic payload,
    bool isRegistration = false,
  }) async =>
      await http.put(
        Uri.parse(presigned),
        body: payload,
      );
}

/// HANDLE API RESPONSE
handleResponse(response) {
  if (response.statusCode == 200) {
    return response.body.toString();
  } else {
    throw jsonDecode(response.body)["error"];
  }
}
