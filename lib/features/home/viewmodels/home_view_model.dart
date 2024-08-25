import 'package:cine_vibe/features/common/viewmodels/loading_viewmodel.dart';
import 'package:cine_vibe/features/home/repositories/home_repo.dart';
import 'package:cine_vibe/features/profile/repositories/profile_repo.dart';
import 'package:cine_vibe/helpers/web_services_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends LoadingViewmodel {
  HomeRepo repo;
  ProfileRepo profileRepo;
  HomeViewModel({
    required this.repo,
    required this.profileRepo,
  });

  getProfile({required BuildContext context}) async {
    await handleResponseHelper(
        context: context,
        function: () async {
          Response response = await profileRepo.getUserProfile();
        });
  }
}
