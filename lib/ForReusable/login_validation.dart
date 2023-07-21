import 'dart:async';

class FormValidation {
  final _emailController = StreamController<String>();
  final _passwordController = StreamController<String>();

  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get passwordStream => _passwordController.stream;

  void dispose() {
    _emailController.close();
    _passwordController.close();
  }

  void validateEmail(String email) {
    if (email.isNotEmpty && email.contains('@')) {
      _emailController.add(email);
    } else {
      _emailController.addError('Invalid Email');

    }
  }

  void validatePassword(String password) {
    if (password.isNotEmpty && password.length >= 6 && password.length <= 20) {
      _passwordController.add(password);
    } else {
      _passwordController.addError('Invalid Password');
    }
  }
}
