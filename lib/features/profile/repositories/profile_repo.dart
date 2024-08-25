import 'package:cine_vibe/utils/urls.dart';
import 'package:dio/dio.dart';

import '../../../services/base_client.dart';

abstract class ProfileRepo {
  Future getUserProfile();
}

class ProfileRepoImpl extends ProfileRepo {
  /// GET USER PROFILE DETAILS
  @override
  Future getUserProfile() async {
    Response response =
        await APIService().getDataFromDio(endPoint: authGetProfile);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw response.data["error"];
    }
  }
}
