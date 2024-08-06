import 'package:cine_vibe/features/auth/repositories/auth_repo.dart';
import 'package:cine_vibe/features/auth/viewmodels/auth.viewmodel.dart';
import 'package:cine_vibe/services/locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/auth/views/auth_view.dart';

void main() {
  setUpLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthViewmodel>(
          create: (_) => AuthViewmodel(
            repo: locator<AuthRepo>(),
          ),
        ),
      ],
      child: const MaterialApp(
        home: AuthView(),
      ),
    );
  }
}
