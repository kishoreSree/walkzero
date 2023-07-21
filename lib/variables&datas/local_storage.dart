import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {
  static final _storage = FlutterSecureStorage();
  static const _forEmail = 'Email';
  static const _forPassword = 'Password';

  static Future setEmail(String Email) async {
    await _storage.write(key: _forEmail, value: Email);
  }

  static Future getEmail() async {
    return _storage.read(key: _forEmail);
  }

  static Future setPassword(String password) async {
    await _storage.write(key: _forPassword, value: password);
  }

  static Future getPassword() async {
    return _storage.read(key: _forPassword);
  }
}
