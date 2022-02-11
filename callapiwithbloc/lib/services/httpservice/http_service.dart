import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'interceptors/interceptors.dart';

class HttpService {
  final dio = Dio(BaseOptions(
    baseUrl: "https://www.boredapi.com/api/",
    connectTimeout: 5000,
    receiveTimeout: 5000,
    // headers: {HttpHeaders.userAgentHeader: 'dio', 'common-header': 'xx'},
  ))
    ..interceptors.add(AuthInterceptor())
    ..interceptors.add(Logging())
    ..interceptors.add(PrettyDioLogger(
      requestBody: true,
      responseBody: true,
      // requestHeader: true,
    ));
}
