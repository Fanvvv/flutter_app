import 'package:dio/dio.dart';

class UserAPI {
  final Dio _dio;

  UserAPI(this._dio);

  /// 登录
  Future<dynamic> login({ required String phone, required String password }) async {
    FormData formData = FormData.fromMap({
      'phone': phone,
      'password': password
    });
    print(phone);
    print(password);
    Response res = await _dio.post('/front/user/login', data: formData);

    if (res.data != null) {
      return res.data['content'];
    } else {
      return false;
    }
  }
}