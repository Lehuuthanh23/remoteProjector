import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:remote_project/app/app_sp.dart';
import 'package:remote_project/app/app_sp_key.dart';
import 'package:remote_project/app/string_utils.dart';
import 'package:remote_project/model/device/device_model.dart';
import 'package:remote_project/model/user/user_info_model.dart';

class DeviceController {
  DeviceController({required this.dio});
  Dio dio;
  Future<List<Device>> getDevices() async {
    List<Device> lstDevice = [];
    String userInfo = AppSP.get(AppSPKey.user_info);
    final userJson = jsonDecode(userInfo);
    UserInfoModel currentUser = UserInfoModel.fromJson(userJson);
    final response = await dio.get(
      '${StringUtils.httpApiPro}${StringUtils.getDevices}/%5bcustomer_idfrom',
      //'${StringUtils.httpApiPro}${StringUtils.getDevices}/${currentUser.customerId}',
    );
    final responseData = jsonDecode(response.data);
    print(responseData);
    List<dynamic> deviceList = responseData['Device_list'];
    if (deviceList.isNotEmpty) {
      lstDevice = deviceList.map((e) => Device.fromJson(e)).toList();
    }
    return lstDevice;
  }
}
