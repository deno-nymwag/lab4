import 'package:flutter/material.dart';
import 'services/auth_service.dart';
import 'repositories/shared_preferences_repository.dart';

import 'login_page.dart';
import 'home_page.dart';

void main() {
  final storage = SharedPreferencesRepository();
  final authService = AuthService(storage);

  runApp(MyApp(authService: authService));
}

class MyApp extends StatelessWidget {
  final AuthService authService;

  const MyApp({Key? key, required this.authService}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder<bool>(
        future: authService.checkIfLoggedIn(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snapshot.hasData && snapshot.data == true) {
            return HomePage(authService: authService);
          } else {
            return LoginPage(authService: authService);
          }
        },
      ),
    );
  }
}
