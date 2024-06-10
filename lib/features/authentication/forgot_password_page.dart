import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:remote_project/features/authentication/create_new_password_page.dart';
import 'package:remote_project/widget/basePage.dart';
import 'package:remote_project/widget/buttonCustom.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _emailController = TextEditingController();
    String? _errorMessage;

    @override
    void initState() {
      super.initState();
    }

    @override
    void dispose() {
      _emailController.dispose();
      super.dispose();
    }

    void sendRequest() {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => CreateNewPasswordPage()));
    }

    void _setErrorMessage(String message) {
      setState(() {
        _errorMessage = message;
      });
    }

    return BasePage(
      showAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Top Centered Container
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 16),
              padding: const EdgeInsets.all(16),
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
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 68, vertical: 16),
                decoration: BoxDecoration(
                  color: const Color(0xffEB6E2C),
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
                child: Text(
                  "Quên mật khẩu",
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 32.0),
          if (_errorMessage != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                _errorMessage!,
                style: TextStyle(color: Colors.red),
                textAlign: TextAlign.center,
              ),
            ),
          SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: _emailController,
                      decoration:
                          const InputDecoration(labelText: 'Email đã đăng ký'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Xin hãy nhập email';
                        }
                        return null;
                      },
                    ),
                    ButtomCustom(
                      onPressed: () => sendRequest(),
                      title: "Gửi",
                      textSize: 27,
                      margin:
                          const EdgeInsets.only(top: 32, left: 64, right: 64),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
