import 'package:cine_vibe/helpers/web_service_helper.dart';
import 'package:cine_vibe/utils/urls.dart';
import 'package:dio/dio.dart';

abstract class ProfileRepo {
  Future getUserProfile();
}

class ProfileRepoImpl extends ProfileRepo {
  /// GET USER PROFILE DETAILS
  @override
  Future getUserProfile() async {
    Response response = await APIService().getData(endPoint: authGetProfile);
    return handleResponse(response);
  }
}
