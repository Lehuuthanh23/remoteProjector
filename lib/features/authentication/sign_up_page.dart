import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:remote_project/controller/authentication/sign_up%20controller.dart';
import 'package:remote_project/model/authentication/request/sign_up_request_model.dart';
import 'package:remote_project/features/home/home_page.dart';
import 'package:remote_project/widget/buttonCustom.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  String? _errorMessage;
  late SignUpController _signUpController;

  @override
  void initState() {
    super.initState();
    _signUpController = SignUpController(dio: Dio());
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _signUp() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _errorMessage = null;
    });

    final signUpModel = SignUpRequestModel(
      name: _nameController.text,
      email: _emailController.text,
      phone: _phoneController.text,
      password: _passwordController.text,
    );

    final errorMessage = await _signUpController.signUp(signUpModel);

    if (errorMessage == null) {
      // Successful sign up
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    } else {
      // Sign up failed
      _setErrorMessage(errorMessage);
    }
  }

  void _setErrorMessage(String message) {
    setState(() {
      _errorMessage = message;
    });
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
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: 'Họ và Tên'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Xin vui lòng nhập Họ và Tên';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
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
                    controller: _phoneController,
                    decoration:
                        const InputDecoration(labelText: 'Số điện thoại'),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Xin vui lòng nhập số điện thoại';
                      }
                      if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                        return 'Xin vui lòng nhập số điện thoại đúng định dạng';
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
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: _confirmPasswordController,
                    decoration:
                        const InputDecoration(labelText: 'Xác nhận mật khẩu'),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Xin hãy xác nhận mật khẩu';
                      }
                      if (value != _passwordController.text) {
                        return 'Mật khẩu không khớp';
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
                  ButtomCustom(
                    onPressed: _passwordController.text !=
                            _confirmPasswordController.text
                        ? () {}
                        : _signUp,
                    title: "ĐĂNG KÝ",
                    textSize: 27,
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
