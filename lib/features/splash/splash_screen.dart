import 'package:flutter/material.dart';
import 'package:remote_project/features/authentication/authentication_page.dart';
import 'package:remote_project/widget/buttonCustom.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Color(0xFFFABD1D),
                Color(0xFFEB6E2C),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const Text(
                  'REMOTE PROJECTOR',
                  style: TextStyle(
                      fontSize: 33,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Image.asset(
                  'assets/images/ic_projector.png',
                  width: 236,
                  height: 199.13,
                ),
                ButtomCustom(
                  textSize: 27,
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AuthenticationPage(
                        index: 0,
                      ),
                    ),
                  ),
                  title: "ĐĂNG NHẬP",
                  isSplashScreen: true,
                ),
                SizedBox(
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Bạn chưa có tài khoản?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AuthenticationPage(
                                index: 1,
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          'ĐĂNG KÍ TẠI ĐÂY',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 27,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 110),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(2.5),
                          ),
                          child: const SizedBox(
                            height: 5,
                            width: double.infinity,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
