import 'package:flutter/material.dart';
import 'package:logic_bloc/src/screens/login_screen.dart';
import 'bloc/provider.dart';

//with using bloc pattern , we don't have to use
//stateful widgets
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: 'Login',
        home: Scaffold(
          body: LoginScreen(),
        ),
      ),
    );
  }
}
