import 'package:dio/dio.dart';
import 'initDio.dart';
import 'AdAPI.dart';
import 'CourseAPI.dart';
import 'UserAPI.dart';

class API {
  late Dio _dio;

  API() {
    _dio = initDio();
  }

  /// 广告接口
  AdAPI get ad => AdAPI(_dio);

  /// 课程列表接口
  CourseAPI get course => CourseAPI(_dio);

  /// 登录
  UserAPI get user => UserAPI(_dio);
}

