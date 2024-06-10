import 'package:flutter/material.dart';
import 'package:remote_project/features/home/home_page.dart';
import 'package:remote_project/features/splash/splash_screen.dart';
import 'package:remote_project/app/app_sp.dart';
import 'package:remote_project/app/app_sp_key.dart';
import 'package:remote_project/app/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjection.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late String? cookieKey = "";
  @override
  void initState() {
    cookieKey = AppSP.get(AppSPKey.PHPSESSID) ?? "";
    print(cookieKey);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xffEB6E2C)),
          useMaterial3: true,
        ),
        home: cookieKey != "" ? const HomePage() : const SplashScreen());
  }
}
