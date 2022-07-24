import 'package:dio/dio.dart';

class CourseAPI {
  final Dio _dio;

  CourseAPI(this._dio);

  /// 课程列表
  Future<dynamic> courseList() async {
    Response res = await _dio.get('/front/course/getAllCourse');

    List courseList = res.data['content'];
    return courseList;
  }
}