class UserInfoModel {
  String customerId;
  String customerName;
  String address;
  String phoneNumber;
  String email;
  String dateOfBirth;
  String sex;
  String chuTk;
  String stk;
  String nganhang;
  String chinhanh;

  UserInfoModel({
    required this.customerId,
    required this.customerName,
    required this.address,
    required this.phoneNumber,
    required this.email,
    required this.dateOfBirth,
    required this.sex,
    required this.chuTk,
    required this.stk,
    required this.nganhang,
    required this.chinhanh,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) {
    return UserInfoModel(
      customerId: json['customer_id'],
      customerName: json['customer_name'],
      address: json['address'],
      phoneNumber: json['phone_number'],
      email: json['email'],
      dateOfBirth: json['date_of_birth'],
      sex: json['sex'],
      chuTk: json['chu_tk'],
      stk: json['stk'],
      nganhang: json['nganhang'],
      chinhanh: json['chinhanh'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'customer_id': customerId,
      'customer_name': customerName,
      'address': address,
      'phone_number': phoneNumber,
      'email': email,
      'date_of_birth': dateOfBirth,
      'sex': sex,
      'chu_tk': chuTk,
      'stk': stk,
      'nganhang': nganhang,
      'chinhanh': chinhanh,
    };
  }

  @override
  String toString() {
    return 'CustomerInfo(customerId: $customerId, customerName: $customerName, address: $address, phoneNumber: $phoneNumber, email: $email, dateOfBirth: $dateOfBirth, sex: $sex, chuTk: $chuTk, stk: $stk, nganhang: $nganhang, chinhanh: $chinhanh)';
  }
}
