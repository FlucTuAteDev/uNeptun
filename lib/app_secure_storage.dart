import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:u_neptun/model/user.dart';

class AppSecureStorage {
  static const _storage = FlutterSecureStorage();
  static const _keyUser = "user";


  static Future<User?> getUser() async {
    String? userStr = await _storage.read(key: _keyUser);
    if (userStr == null) return null;
    
    return User.fromJson(jsonDecode(userStr));
  }

  static Future<void> setUser(User user) async {
    await _storage.write(key: _keyUser, value: jsonEncode(user));
  }
}
