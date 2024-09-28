import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;

class AuthProvider2 with ChangeNotifier {
  bool isAuthenticated = false;
  final List<String> scopes = ['https://www.googleapis.com/auth/generative-language.retriever'];
  
  Future<void> initAuth() async {
    var creds = await loadCreds();
    if (creds != null) {
      isAuthenticated = true;
      notifyListeners();
    }
  }
Future<Map<String, dynamic>> loadClientSecret() async {
  final jsonString = await rootBundle.loadString('assets/client_secret.json');
  return json.decode(jsonString);
}
  Future<AccessCredentials?> loadCreds() async {
    // Cargar las credenciales desde el archivo JSON
    final credentialsJson = await loadClientSecret();
    final clientId = ClientId(
      credentialsJson['installed']['client_id'],
      credentialsJson['installed']['client_secret'],
    );
    print(credentialsJson);
    // Manejo del flujo de autenticación
    return clientViaUserConsent(clientId, scopes, (url) {
      print('Por favor, visita esta URL en tu navegador: $url');
    }).then((authClient) {
      print('Autenticación exitosa');
      return authClient.credentials;
    }).catchError((e) {
      print('Error en la autenticación: $e');
      return null;
    });
  }
}
