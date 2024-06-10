import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:remote_project/app/app_utils.dart';
import 'package:remote_project/features/home/home_page.dart';
import 'package:remote_project/model/authentication/request/login_request_model.dart';
import 'package:remote_project/model/authentication/response/login_response_model.dart';
import 'package:remote_project/app/app_sp.dart';
import 'package:remote_project/app/app_sp_key.dart';
import 'package:remote_project/app/string_utils.dart';

class LoginController {
  final Dio dio;

  LoginController({required this.dio});

  Future<String?> login(BuildContext context, LoginRequestModel user) async {
    final formData = FormData.fromMap({
      'email': user.email,
      'password': user.password,
    });

    try {
      final response = await dio.post(
        AppUtils.createUrl(StringUtils.login),
        data: formData,
        options: AppUtils.createOptionsNoCookie(),
      );

      final responseData = jsonDecode(response.data);
      // Deserialize response into LoginResponseModel
      final loginResponse = LoginResponseModel.fromJson(responseData);

      if (loginResponse.status == 1 && loginResponse.info.isNotEmpty) {
        onLoginSuccess(context, response, loginResponse);
        return null; // Successful login, no error message
      } else {
        return loginResponse.msg ?? 'Đăng nhập lỗi'; // Return error message
      }
    } on DioError catch (e) {
      debugPrint('Dio Error: ${e.message}');
      debugPrint('Response data: ${e.response?.data}');
      return 'Có lỗi xảy ra: ${e.message}';
    } catch (e) {
      debugPrint('Lỗi khác: $e');
      return 'Có lỗi xảy ra. Vui lòng thử lại.';
    }
  }

  void onLoginSuccess(BuildContext context, Response<dynamic> response,
      LoginResponseModel loginResponse) async {
    // Save PHPSESSID cookie to SharedPreferences
    final cookies = response.headers['set-cookie'];
    if (cookies != null && cookies.isNotEmpty) {
      final phpsessidCookie =
          cookies.firstWhere((cookie) => cookie.startsWith('PHPSESSID='));
      final phpsessid = phpsessidCookie.split(';').first.split('=').last;
      await AppSP.set(AppSPKey.PHPSESSID, phpsessid);
    }

    // Save user info to SharedPreferences
    if (loginResponse.info.isNotEmpty) {
      await AppSP.set(
          AppSPKey.user_info, jsonEncode(loginResponse.info.first.toJson()));
    }

    String id = AppSP.get(AppSPKey.PHPSESSID);
    String userInfo = AppSP.get(AppSPKey.user_info);
    debugPrint('id: $id  userinfo: $userInfo');

    // Navigate to the home screen
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }
}
