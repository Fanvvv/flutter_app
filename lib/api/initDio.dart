import 'package:dio/dio.dart';

Dio initDio() {
  BaseOptions _baseOptions = BaseOptions(
    baseUrl: 'http://edufront.lagounews.com/',
    connectTimeout: 5000,
  );

  // 初始化
  Dio dio = Dio(_baseOptions);

  // 添加拦截器
  dio.interceptors.add(
    InterceptorsWrapper(
      // 请求拦截
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        return handler.next(options);
      },
      // 响应拦截
      onResponse: (Response response, ResponseInterceptorHandler handler) {
        if (response.data == null || response.data['state'] != 1) {
          print('响应失败：'+response.data['message']);
          response.data = null;
        }
        return handler.next(response);
      },
      onError: (DioError error, ErrorInterceptorHandler handler) {
        return handler.next(error);
      }
    )
  );
  return dio;
}