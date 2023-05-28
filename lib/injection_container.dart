import 'package:base_project/app/app_config.dart';
import 'package:base_project/data/api/app_rest_api.dart';
import 'package:base_project/data/api/dio_builder.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init(AppConfig appConfig) async {
  if (sl.isRegistered<AppConfig>()) return;

  sl
    ..registerSingleton(appConfig)
    ..registerSingleton(await DioBuilder.buildDio(appConfig));
  if (appConfig.appMockSettings.isMocked) {
  } else {
    sl.registerSingleton(AppRestApi(sl()));
  }
}
