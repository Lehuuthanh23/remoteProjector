class SignUpResponseModel {
  String status;
  String msg;
  String? id;

  SignUpResponseModel({
    required this.status,
    required this.msg,
    this.id,
  });

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) {
    return SignUpResponseModel(
      status: json['status'],
      msg: json['msg'],
      id: json['info'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'msg': msg,
      'info': id,
    };
  }

  @override
  String toString() {
    return 'SignUpResponseModel(status: $status, msg: $msg, id: $id)';
  }
}
