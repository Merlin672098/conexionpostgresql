import 'package:conexionpostresql/interfaceadapters/service/servicios_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../constants/constants.dart';


class ServiciosService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _currentUser;


  void signIn({
    required BuildContext context,
    //required String email,
  }) async {
    try {
      GoogleSignInAccount? user = await _googleSignIn.signIn();
      if (user != null) {
        //print('User signed in: ${user.email}');

        GoogleSignInAuthentication auth = await user.authentication;
        String email = user.email;

        //print('User email: $email');

        await _verifyEmailWithBackend(context, email);
      } else {
        print('Google Sign-In failed or was cancelled');
      }
    } catch (error) {
      print('Error during Google sign-in: $error');
    }
  }

    Future<void> _verifyEmailWithBackend(BuildContext context, String email) async {
    try {
      print('Sending email to backend: $email');

      final response = await http.post(
        Uri.parse('$uri/api/signinGoogle'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print('Logged in successfully: $data');

        Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(builder: (context) => ServiciosScreen(onNavigate: (int ) {  },)),
        );
      } else {
        print('Error verifying email: ${response.body}');
      }
    } catch (error) {
      print('Error during email verification: $error');
    }
  }

    void signOut({
      required BuildContext context,
    }) async {
      _googleSignIn.disconnect();
    }
}
