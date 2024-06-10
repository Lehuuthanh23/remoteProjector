class User {
  final String? customerId;
  final String? customerName;
  final String? address;
  final String? phoneNumber;
  final String? email;
  final String? dateOfBirth;
  final String? sex;
  final String? chuTk;
  final String? stk;
  final String? nganhang;
  final String? chinhanh;

  User({
    this.customerId,
    this.customerName,
    this.address,
    this.phoneNumber,
    this.email,
    this.dateOfBirth,
    this.sex,
    this.chuTk,
    this.stk,
    this.nganhang,
    this.chinhanh,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
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
}
