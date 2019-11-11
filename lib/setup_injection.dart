import 'package:get_it/get_it.dart';

import 'service/languages_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => LanguageService());
}
