import 'package:cine_vibe/features/auth/views/auth_view.dart';
import 'package:cine_vibe/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../services/shared_pref_helper.dart';
import '../../home/views/home_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((v) async {
      final userId = SharedPreferencesManager.getUserId();
      Future.delayed(const Duration(milliseconds: 5000)).then((value) {
        if (userId != null) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const HomeView()));
        } else {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const AuthView()));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("CineVibe", style: ts20C00Wbold),
            SizedBox(height: 20.h),
            const CupertinoActivityIndicator(),
          ],
        ),
      ),
    );
  }
}
