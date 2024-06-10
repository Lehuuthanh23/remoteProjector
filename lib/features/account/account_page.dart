import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:remote_project/controller/account/account_controller.dart';
import 'package:remote_project/features/account/widgets/account_list_title.dart';
import 'package:remote_project/model/user/user_info_model.dart';

import 'package:remote_project/widget/basePage.dart';
import 'package:remote_project/widget/buttonCustom.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final AccountPageController _controller = AccountPageController();
  UserInfoModel? customer;

  @override
  void initState() {
    super.initState();
    _loadCustomer();
  }

  Future<void> _loadCustomer() async {
    final loadedCustomer = await _controller.getCustomer();
    if (loadedCustomer != null) {
      setState(() {
        customer = loadedCustomer;
      });
    }
  }

  Future<void> _showSignOutDialog(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Xác nhận đăng xuất'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Bạn có chắc chắn là muốn đăng xuất không?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Huỷ bỏ'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Đăng xuất'),
              onPressed: () => _controller.performSignOut(context),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      showAppBar: true,
      showActions: true,
      title: 'THÔNG TIN TÀI KHOẢN',
      body: Column(
        children: [
          AccountListTile(
            isCenter: true,
            title: 'Đăng xuất',
            leadingIcon: const Icon(
              Icons.power_settings_new_rounded,
              size: 24,
              color: Color(0xff797979),
            ),
            onTap: () => _showSignOutDialog(context),
          ),
          AccountListTile(
            customTitle: const Row(
              children: [
                Text('Hỗ trợ hotline: '),
                Text(
                  '09191119991',
                  style: TextStyle(color: Color(0xffEB6E2C)),
                )
              ],
            ),
            leadingIcon: Image.asset(
              'assets/images/ic_phone.png',
              width: 24,
              height: 24,
            ),
            onTap: () => print('Nhấn vào listtile'),
          ),
          AccountListTile(
            title: 'Đổi mật khẩu',
            leadingIcon: Image.asset(
              'assets/images/ic_password.png',
              width: 24,
              height: 24,
            ),
            trailingWidget: const Icon(
              Icons.arrow_forward_ios_outlined,
              size: 20,
              color: Color(0xffA4A4A4),
            ),
            onTap: () => print('Nhấn vào listtile'),
          ),
          const SizedBox(height: 30),
          AccountListTile(
            title: 'Họ & tên',
            leadingIcon: Image.asset(
              'assets/images/ic_profile.png',
              width: 24,
              height: 24,
            ),
            onTap: () => print('Nhấn vào listtile'),
            trailingWidget: Text(
              customer?.customerName ?? '',
              style: const TextStyle(fontSize: 16, color: Color(0xff797979)),
            ),
          ),
          AccountListTile(
            title: 'Ngày sinh',
            leadingIcon: Image.asset(
              'assets/images/ic_calendar.png',
              width: 24,
              height: 24,
            ),
            onTap: () => print('Nhấn vào listtile'),
            trailingWidget: Text(
              customer != null
                  ? DateFormat('dd-MM-yyyy').format(
                      DateTime.parse(customer!.dateOfBirth ?? "0000-00-00"))
                  : 'Thêm ngày, tháng, năm sinh',
              style: const TextStyle(fontSize: 16),
            ),
          ),
          AccountListTile(
            title: 'Giới tính',
            leadingIcon: Image.asset(
              'assets/images/ic_sex.png',
              width: 24,
              height: 24,
            ),
            onTap: () => print('Nhấn vào listtile'),
            trailingWidget: Text(
              customer != null &&
                      customer!.sex != null &&
                      customer!.sex!.isNotEmpty
                  ? customer!.sex!
                  : 'Thêm thông tin giới tính',
              style: const TextStyle(fontSize: 16, color: Color(0xff797979)),
            ),
          ),
          AccountListTile(
            title: 'Số điện thoại',
            leadingIcon: Image.asset(
              'assets/images/ic_phone_number.png',
              width: 24,
              height: 24,
            ),
            onTap: () => print('Nhấn vào listtile'),
            trailingWidget: Text(
              customer?.phoneNumber ?? '',
              style: const TextStyle(fontSize: 16, color: Color(0xff797979)),
            ),
          ),
          AccountListTile(
            title: 'Địa chỉ email',
            leadingIcon: Image.asset(
              'assets/images/ic_email.png',
              width: 24,
              height: 24,
            ),
            onTap: () => print('Nhấn vào listtile'),
            trailingWidget: Text(
              customer?.email ?? '',
              style: const TextStyle(fontSize: 16, color: Color(0xff797979)),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
            child: ButtomCustom(
                onPressed: () {}, title: 'Lưu thông tin', textSize: 18),
          )
        ],
      ),
    );
  }
}
