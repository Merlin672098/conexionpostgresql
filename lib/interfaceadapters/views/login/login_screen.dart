import 'package:conexionpostresql/interfaceadapters/service/login_service.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


class LoginScreen extends StatefulWidget {
    final VoidCallback onClickedSignUp;
  const LoginScreen({Key? key,
    required this.onClickedSignUp,
  }) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginService loginService = LoginService();
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _currentUser;

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
  }

  void signInUser() {
    loginService.signIn(
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    GoogleSignInAccount? user = _currentUser;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/logo3.png',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              const Spacer(),
              Center(
                child: ElevatedButton.icon(
                  onPressed: signInUser,
                  icon: Image.asset(
                    'assets/Google__G__logo.png',
                    height: 24,
                    width: 24,
                  ),
                  label: const Text('Iniciar sesión con Google'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black, backgroundColor: Colors.white,
                    minimumSize: const Size(230, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16), 
              const Text(
                'Unidad de Modernización y TIC',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 105), 
            ],
          ),
        ],
      ),
    );
  }
}
