import 'package:fcps_pearls/main.dart';

class AuthenticationBloc extends ChangeNotifier {
  /// STATE
  Authentication authentication = Authentication();
  login() {
    authentication..id = emailToLogin.codeUnits.length;
    // navigator.authenticated();
  }

  logout() {
    // navigator.unAuthenticated();
  }

  create() {
    // navigator.authenticated();
  }

  delete() {
    // navigator.unAuthenticated();
  }

  update(Authentication _authentication) {
    authentication = _authentication;
  }

  bool get isAuthenticated => authentication.id != null;

  /// login handling
  String emailToLogin = 'adn@gmail.com';
  void onEmailToLogin(value) {
    emailToLogin = value;
  }

  String passwordToLogin = '12345678';
  void onPasswordToLogin(value) {
    passwordToLogin = value;
  }
}

class Authentication {
  int? id;
}
