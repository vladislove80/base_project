import 'package:base_project/data/api/endpoints.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'app_rest_api.g.dart';

@RestApi()
abstract class AppRestApi {
  factory AppRestApi(Dio dio, {String baseUrl}) = _AppRestApi;

  @GET('${Endpoints.basePath}/')
  Future<void> getSomeConfig(@Path('some') String some);
}
