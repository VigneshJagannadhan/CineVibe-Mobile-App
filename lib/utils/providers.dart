import 'package:cine_vibe/features/auth/repositories/auth_repo.dart';
import 'package:cine_vibe/features/auth/viewmodels/auth.viewmodel.dart';
import 'package:cine_vibe/features/profile/repositories/profile_repo.dart';
import 'package:cine_vibe/features/profile/viewmodels/profile_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../features/home/repositories/home_repo.dart';
import '../features/home/viewmodels/home_view_model.dart';
import '../services/locator.dart';

List<SingleChildWidget> get providers => [
      ChangeNotifierProvider<AuthViewmodel>(
        create: (_) => AuthViewmodel(
          repo: locator<AuthRepo>(),
        ),
      ),
      ChangeNotifierProvider<ProfileViewmodel>(
        create: (_) => ProfileViewmodel(
          repo: locator<ProfileRepo>(),
        ),
      ),
      ChangeNotifierProvider<HomeViewModel>(
        create: (_) => HomeViewModel(
          repo: locator<HomeRepo>(),
          profileRepo: locator<ProfileRepo>(),
        ),
      ),
    ];
