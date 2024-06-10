import 'package:dio/dio.dart';
import 'package:remote_project/app/app_sp.dart';
import 'package:remote_project/app/app_sp_key.dart';
import 'package:remote_project/app/string_utils.dart';
import 'package:remote_project/model/user/user.dart';

class AppUtils {
  //http url
  static String createUrl(String toMerge) {
    return '${StringUtils.httpApiPro}$toMerge';
  }

  static String createUrlWithUserId(String toMerge, String userId) {
    return '${StringUtils.httpApiPro}$toMerge$userId';
  }

  //option when send api
  static Options createOptionsWithCookie(String cookieData) {
    return Options(
      headers: {
        'Cookie': 'PHPSESSID=$cookieData',
        'Content-Type': 'multipart/form-data',
      },
    );
  }

  static Options createOptionsNoCookie() {
    return Options(
      headers: {
        'Content-Type': 'multipart/form-data',
      },
    );
  }

  //get user id
  static Future<String> getUserIdFromLocal() async {
    var storedUserInfo = await AppSP.retrieveItem(AppSPKey.user_info);
    if (storedUserInfo != null) {
      final User userData = User.fromJson(storedUserInfo);
      return userData.customerId ?? "";
    } else {
      return "";
    }
  }
}
