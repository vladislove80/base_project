import 'package:base_project/app/app.dart';
import 'package:base_project/app/app_config.dart';
import 'package:base_project/utils/app_platform.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class DioBuilder {
  static const _defaultConnectionTimeout = Duration(seconds: 20);
  static const _defaultReceiveTimeout = Duration(seconds: 20);

  static Future<Dio> buildDio(AppConfig appConfig) async {
    final options = BaseOptions(
      connectTimeout: _defaultConnectionTimeout,
      receiveTimeout: _defaultReceiveTimeout,
    );

    return _build(
      buildOptions: options,
      appConfig: appConfig,
      logPrint: (object) {
        //todo add some log system
      },
    );
  }

  static Future<Dio> _build({
    required BaseOptions buildOptions,
    required AppConfig appConfig,
    required void Function(Object) logPrint,
  }) async {
    final dio = Dio(buildOptions)
      //..transformer = FlutterTransformer() - to parse json in compute
      ..interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          logPrint: logPrint,
        ),
      );

    if (App.isStaging &&
        !appConfig.appMockSettings.isMocked &&
        !AppPlatform.isWeb) {
      (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
          (client) =>
              client..badCertificateCallback = (cert, host, port) => true;
    }

    return dio;
  }
}
