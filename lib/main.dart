import 'package:cine_vibe/features/common/views/splash_view.dart';
import 'package:cine_vibe/services/locator.dart';
import 'package:cine_vibe/services/shared_pref_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'features/auth/views/auth_view.dart';
import 'utils/providers.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUpLocator();
  await SharedPreferencesManager.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return const MaterialApp(
              home: SplashView(),
            );
          }),
    );
  }
}
