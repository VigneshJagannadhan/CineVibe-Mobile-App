import 'package:get_it/get_it.dart';

import '../features/auth/repositories/auth_repo.dart';
import '../features/profile/repositories/profile_repo.dart';

final GetIt locator = GetIt.instance;

void setUpLocator() {
  locator.registerFactory<AuthRepo>(() => AuthRepoImpl());
  locator.registerFactory<ProfileRepo>(() => ProfileRepoImpl());
}
