import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:remote_project/features/splash/splash_screen.dart';
import 'package:remote_project/model/user/get_user_response_model.dart';
import 'package:remote_project/app/app_sp.dart';
import 'package:remote_project/app/app_sp_key.dart';
import 'package:remote_project/app/string_utils.dart';
import 'package:remote_project/model/user/user_info_model.dart';

class AccountPageController {
  late Dio dio;

  AccountPageController() {
    dio = Dio();
  }

  Future<UserInfoModel?> getCustomer() async {
    try {
      var storedUserInfo = await AppSP.retrieveItem(AppSPKey.user_info);
      if (storedUserInfo != null) {
        final UserInfoModel userData = UserInfoModel.fromJson(storedUserInfo);

        final response = await dio.get(
          '${StringUtils.httpApiPro}${StringUtils.getCustomer}/${userData.customerId}',
        );
        final responseData = jsonDecode(response.data);
        print(responseData);

        UserResponseModel customerResponse =
            UserResponseModel.fromJson(responseData);
        if (customerResponse.userList.isNotEmpty) {
          var updatedUser = customerResponse.userList.first;
          return updatedUser;
        } else {
          // Handle case where no user information is returned from the API
          print('Không có dữ liệu user từ API');
          return userData; // Return original stored user data
        }
      } else {
        print('Không có dữ liệu user từ SharedPreferences');
        return null;
      }
    } catch (e) {
      print('Error fetching customer: $e');
      return null;
    }
  }

  void performSignOut(BuildContext context) {
    AppSP.set(AppSPKey.PHPSESSID, null);
    AppSP.set(AppSPKey.user_info, null);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const SplashScreen()),
    );
  }
}
