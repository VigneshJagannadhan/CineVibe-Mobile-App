import 'package:cine_vibe/features/profile/viewmodels/profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  ProfileViewmodel? profileViewmodel;
  @override
  void initState() {
    super.initState();
    profileViewmodel = Provider.of<ProfileViewmodel>(context, listen: false);
    profileViewmodel?.getUserProfile(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(profileViewmodel?.userModel?.name ?? "Loading.."),
          Text(profileViewmodel?.userModel?.username ?? "Loading.."),
          Text(profileViewmodel?.userModel?.email ?? "Loading.."),
        ],
      ),
    );
  }
}
