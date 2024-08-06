import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../services/shared_pref_helper.dart';
import '../../common/viewmodels/loading_viewmodel.dart';
import '../models/token_model.dart';
import '../repositories/auth_repo.dart';

class AuthViewmodel extends LoadingViewmodel {
  AuthRepo repo;
  AuthViewmodel({required this.repo});

  String? _name;
  String? get name => _name;
  set name(name) {
    _name = name;
  }

  String? _username;
  String? get username => _username;
  set username(username) {
    _username = username;
  }

  String? _email;
  String? get email => _email;
  set email(email) {
    _email = email;
  }

  String? _password;
  String? get password => _password;
  set password(password) {
    _password = password;
  }

  registerUser(context) async {
    Map<String, dynamic> data = {
      "name": _name,
      "username": _username,
      "email": _email,
      "password": _password,
    };
    try {
      Response response = await repo.registerUser(data);
      TokenModel tokenModel =
          TokenModel.fromJson(jsonDecode(response.toString()));
      SharedPreferencesManager.setUserId(tokenModel.token.toString());
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}
