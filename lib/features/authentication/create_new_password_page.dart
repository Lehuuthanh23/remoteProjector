import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:remote_project/widget/basePage.dart';
import 'package:remote_project/widget/buttonCustom.dart';

class CreateNewPasswordPage extends StatefulWidget {
  const CreateNewPasswordPage({super.key});

  @override
  State<CreateNewPasswordPage> createState() => _CreateNewPasswordPageState();
}

class _CreateNewPasswordPageState extends State<CreateNewPasswordPage> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _codeController = TextEditingController();
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    String? _errorMessage;

    @override
    void initState() {
      super.initState();
    }

    @override
    void dispose() {
      _emailController.dispose();
      _codeController.dispose();
      _passwordController.dispose();
      super.dispose();
    }

    void sendRequest() {
      if (!_formKey.currentState!.validate()) {
        return;
      }
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
          const SizedBox(height: 20),
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
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: _codeController,
                      decoration: const InputDecoration(labelText: 'Code'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Xin vui lòng nhập Code';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: _passwordController,
                      decoration: const InputDecoration(labelText: 'Mật khẩu'),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Xin hãy nhập mật khẩu';
                        }
                        return null;
                      },
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
                    const SizedBox(height: 16.0),
                    ButtomCustom(
                      onPressed: () => sendRequest(),
                      title: "Reset password",
                      textSize: 27,
                      margin:
                          const EdgeInsets.only(top: 32, left: 40, right: 40),
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
