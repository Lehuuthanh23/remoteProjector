import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:remote_project/controller/authentication/login_controller.dart';
import 'package:remote_project/features/authentication/forgot_password_page.dart';
import 'package:remote_project/features/home/home_page.dart';
import 'package:remote_project/model/authentication/request/login_request_model.dart';
import 'package:remote_project/model/user/user.dart';
import 'package:remote_project/widget/buttonCustom.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _errorMessage;
  late LoginController _loginController;

  @override
  void initState() {
    super.initState();
    _loginController = LoginController(dio: Dio());
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _errorMessage = null;
    });

    final email = _emailController.text;
    final password = _passwordController.text;

    final user = LoginRequestModel(email: email, password: password);
    final errorMessage = await _loginController.login(context, user);

    if (errorMessage != null) {
      setState(() {
        _errorMessage = errorMessage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Xin hãy nhập email';
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
                  _errorMessage != null
                      ? const SizedBox(height: 16.0)
                      : const SizedBox(height: 16),
                  if (_errorMessage != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Text(
                        _errorMessage!,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ForgotPasswordPage()));
                    },
                    child: const Text(
                      "Quên mật khẩu",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  ButtomCustom(
                    onPressed: _login,
                    title: "ĐĂNG NHẬP",
                    textSize: 27,
                    margin: const EdgeInsets.only(top: 16),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
