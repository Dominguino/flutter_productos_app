import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _fireBaseToken = 'AIzaSyDYpNg1faZZpT8CirQ-z5OtV2m_FTjd5Ho';

//si retornamos algo es un error, si no retornamos nada todo bien
  Future<String?> createUser(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password
    };
    final url =
        Uri.https(_baseUrl, '/v1/accounts:signUp', {'key': _fireBaseToken});
    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);
    print(decodedResp);
    if (decodedResp.containsKey('idToken')) {
      //guardar TOKEN en lugar seguro
      return null;
    } else {
      return decodedResp['error']['message'];
    }
  }

//si retornamos algo es un error, si no retornamos nada todo bien
  Future<String?> login(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password
    };
    final url = Uri.https(
        _baseUrl, '/v1/accounts:signInWithPassword', {'key': _fireBaseToken});
    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);
    print(decodedResp);
    if (decodedResp.containsKey('idToken')) {
      //guardar TOKEN en lugar seguro
      return null;
    } else {
      return decodedResp['error']['message'];
    }
  }
}
