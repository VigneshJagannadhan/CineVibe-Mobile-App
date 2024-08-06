import 'package:cine_vibe/helpers/web_service_helper.dart';
import 'package:cine_vibe/utils/urls.dart';
import 'package:http/http.dart';

abstract class AuthRepo {
  Future registerUser(data);
  Future loginUser();
}

class AuthRepoImpl extends AuthRepo {
  /// REGISTER A NEW USER
  @override
  Future registerUser(data) async {
    Response response =
        await APIService().postData(endPoint: authRegister, payload: data);
    return handleResponse(response);
  }

  /// LOGIN USER
  @override
  Future loginUser() async {
    Response response = await APIService().postData(endPoint: authLogin);
    return handleResponse(response);
  }
}
