import 'package:remote_project/model/user/user_info_model.dart';

class UserResponseModel {
  final int status;
  final String msg;
  final List<UserInfoModel> userList;

  UserResponseModel({
    required this.status,
    required this.msg,
    required this.userList,
  });

  factory UserResponseModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> userJsonList = json['userList'];
    List<UserInfoModel> users = userJsonList
        .map((userJson) => UserInfoModel.fromJson(userJson))
        .toList();

    return UserResponseModel(
      status: json['status'],
      msg: json['msg'],
      userList: users,
    );
  }
}
