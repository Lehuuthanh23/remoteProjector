import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:remote_project/app/app_utils.dart';
import 'package:remote_project/model/authentication/request/sign_up_request_model.dart';
import 'package:remote_project/model/authentication/response/signup_response_model.dart';
import 'package:remote_project/app/string_utils.dart';

class SignUpController {
  final Dio dio;

  SignUpController({required this.dio});

  Future<String?> signUp(SignUpRequestModel model) async {
    try {
      final formData = FormData.fromMap({
        'customer_name': model.name,
        'phone_number': model.phone,
        'email': model.email,
        'password': model.password,
      });

      final response = await dio.post(
        AppUtils.createUrl(StringUtils.register),
        data: formData,
        options: AppUtils.createOptionsNoCookie(),
      );

      final responseData = jsonDecode(response.data);
      final signUpResponse = SignUpResponseModel.fromJson(responseData);

      if (signUpResponse.status == '1') {
        return null;
      } else {
        return signUpResponse.msg; // Fallback error message
      }
    } on DioError catch (e) {
      return 'Có lỗi xảy ra: ${e.message}';
    } catch (e) {
      return 'Có lỗi xảy ra. Vui lòng thử lại.';
    }
  }
}
