import 'package:fcps_pearls/main.dart';

import '../navigation.dart';
import 'authentication_repository.dart';

class AuthenticationBloc extends ChangeNotifier {
  /// DEPENDENCIES
  final BuildContext context;
  AuthenticationBloc(this.context);
  AuthenticationRepository get authenticationRepository => context.of();
  Navigation get navigationRepository => context.of();

  /// STATE
  Authentication authentication = Authentication();
  login() {
    authentication..id = emailToLogin.codeUnits.length;
    navigationRepository.authenticated();
  }

  logout() {
    navigationRepository.unAuthenticated();
  }

  create() {
    navigationRepository.authenticated();
  }

  delete() {
    navigationRepository.unAuthenticated();
  }

  update(Authentication _authentication) {
    authentication = _authentication;
  }

  bool get isAuthenticated => authentication.id != null;

  /// login handling
  String emailToLogin = 'adn@gmail.com';
  onEmailToLogin(value) => emailToLogin = value;

  String passwordToLogin = '12345678';

  onPasswordToLogin(value) => passwordToLogin = value;
}

class Authentication {
  int? id;
}
