import 'package:flutter/material.dart';
import 'package:remote_project/features/authentication/login_page.dart';
import 'package:remote_project/features/authentication/sign_up_page.dart';
import 'package:remote_project/widget/basePage.dart';

class AuthenticationPage extends StatelessWidget {
  final int index;
  const AuthenticationPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: index,
      length: 2,
      child: BasePage(
        // appBar: AppBar(
        //   backgroundColor: const Color(0xffEB6E2C), // Set AppBar background to white
        //   elevation: 0, // Remove AppBar shadow
        // ),
        showAppBar: true,
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xffE5E5E5),
                borderRadius: BorderRadius.circular(50.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(8),
              child: TabBar(
                indicator: BoxDecoration(
                  color: const Color(0xffEB6E2C),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                labelColor: Colors.white,
                labelStyle:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                unselectedLabelColor: const Color(0xff9E9E9E),
                labelPadding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4),
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: const [
                  Tab(
                    text: 'Đăng nhập',
                  ),
                  Tab(
                    text: 'Đăng ký',
                  ),
                ],
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  LoginPage(),
                  SignUpPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
