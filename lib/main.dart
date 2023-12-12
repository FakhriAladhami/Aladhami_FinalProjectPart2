import 'package:crud_app/views/login_view.dart';
import 'package:flutter/material.dart';
import 'utils/global.dart';

void main() async {
  /// Initialize widgets in Flutter
  WidgetsFlutterBinding.ensureInitialized();
  await initSecureStorage();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quotes App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(foregroundColor: Colors.white)),
      home: const LoginView(),
    );
  }
}

/// Initialize defaul global username and password
Future<void> initSecureStorage() async {
  storage.write(key: 'username', value: globalUsername);
  storage.write(key: 'password', value: globalPassword);
}
