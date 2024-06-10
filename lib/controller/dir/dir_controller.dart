import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:remote_project/app/app_sp.dart';
import 'package:remote_project/app/app_sp_key.dart';
import 'package:remote_project/model/dir/dir_model.dart';
import 'package:remote_project/model/user/user_info_model.dart';
import 'package:remote_project/app/string_utils.dart';

class DirController {
  final Dio dio;
  DirController({required this.dio});
  Future<List<Dir>> getAllDir() async {
    List<Dir> lstDir = [];
    String userInfo = AppSP.get(AppSPKey.user_info);
    final userJson = jsonDecode(userInfo);
    UserInfoModel currentUser = UserInfoModel.fromJson(userJson);
    final response = await dio.get(
      //'${StringUtils.httpApiPro}${StringUtils.getAllDir}/%5bcustomer_idfrom',
      '${StringUtils.httpApiPro}${StringUtils.getCustomerDir}/${currentUser.customerId}', //Lấy Danh Sách thư mục của khách hàng tạo ra
    );
    final responseData = jsonDecode(response.data);
    print(responseData);
    List<dynamic> dirList = responseData['Dir_list'];
    if (dirList.isNotEmpty) {
      lstDir = dirList.map((e) => Dir.fromJson(e)).toList();
    }
    return lstDir;
  }

  Future<void> createDir(String dirName, String dirType) async {
    String userInfo = AppSP.get(AppSPKey.user_info);
    final userJson = jsonDecode(userInfo);
    UserInfoModel currentUser = UserInfoModel.fromJson(userJson);

    final formData = FormData.fromMap({
      'name_dir': dirName,
      'customer_id': currentUser.customerId,
      'type_dir': dirType,
    });
    print(currentUser.customerId);
    final response = await dio.post(
      '${StringUtils.httpApiPro}${StringUtils.createDir}',
      data: formData,
      options: Options(
        headers: {
          'Content-Type': 'multipart/form-data',
        },
      ),
    );
    final responseData = jsonDecode(response.data);
    print(responseData);
    if (responseData['status'] == 1) {
      print('Thêm thành công');
    } else {
      print('Thêm thất bại');
    }
  }

  Future<void> updateDir(String dirName, String dirType, String dirID) async {
    String userInfo = AppSP.get(AppSPKey.user_info);
    final userJson = jsonDecode(userInfo);
    UserInfoModel currentUser = UserInfoModel.fromJson(userJson);

    final formData = FormData.fromMap({
      'name_dir': dirName,
      'customer_id': currentUser.customerId,
      'type_dir': dirType,
    });
    print(currentUser.customerId);
    final response = await dio.post(
      '${StringUtils.httpApiPro}${StringUtils.updateDir}/$dirID',
      data: formData,
      options: Options(
        headers: {
          'Content-Type': 'multipart/form-data',
        },
      ),
    );
    final responseData = jsonDecode(response.data);
    print(responseData);
    if (responseData['status'] == 1) {
      print('Sửa thành công thành công');
    } else {
      print('Sửa thất bại');
    }
  }

  Future<void> deleteDir(String dirID) async {
    final response = await dio.get(
      '${StringUtils.httpApiPro}${StringUtils.deleteDir}/$dirID',
    );
    final responseData = jsonDecode(response.data);
    print(responseData);
    if (responseData['status'] == 1) {
      print('Xóa thành công thành công');
    } else {
      print('Xóa thất bại');
    }
  }
}
