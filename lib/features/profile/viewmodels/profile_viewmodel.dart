import 'dart:convert';

import 'package:cine_vibe/features/common/viewmodels/loading_viewmodel.dart';
import 'package:cine_vibe/features/profile/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../repositories/profile_repo.dart';

class ProfileViewmodel extends LoadingViewmodel {
  ProfileRepo repo;
  ProfileViewmodel({required this.repo});

  /// USER MODEL
  UserModel? _userModel;
  UserModel? get userModel => _userModel;
  set userModel(userModel) {
    _userModel = userModel;
    notifyListeners();
  }

  getUserProfile(context) async {
    try {
      Response response = await repo.getUserProfile();
      userModel = UserModel.fromJson(jsonDecode(response.toString()));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}
