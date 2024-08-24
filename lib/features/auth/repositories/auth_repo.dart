import 'package:cine_vibe/utils/urls.dart';
import 'package:dio/dio.dart';

import '../../../services/base_client.dart';

abstract class AuthRepo {
  Future registerUser(data);
  Future loginUser(data);
}

class AuthRepoImpl extends AuthRepo {
  /// REGISTER A NEW USER
  @override
  Future registerUser(data) async {
    Response response = await APIService()
        .postDataFromDio(endPoint: authRegister, payload: data);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw response.data["error"];
    }
  }

  /// LOGIN USER
  @override
  Future loginUser(data) async {
    Response response =
        await APIService().postDataFromDio(endPoint: authLogin, payload: data);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw response.data["error"];
    }
  }
}
