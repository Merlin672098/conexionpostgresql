import 'package:conexionpostresql/interfaceadapters/views/login/login_screen.dart';
import 'package:flutter/material.dart';

//esto no es una vista

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) => isLogin
      ? LoginScreen(onClickedSignUp: toggle)
      : LoginScreen(onClickedSignUp: toggle);
  // : SignUpWidget(onClickedSignIn: toggle);

  void toggle() => setState(() => isLogin = !isLogin);
}
