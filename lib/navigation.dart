import 'package:fcps_pearls/authentication/login_page.dart';
import 'package:fcps_pearls/main.dart';

class Navigation {
  final navigator = RM.navigate;
  GlobalKey<NavigatorState> get key => navigator.navigatorKey;

  late final to = navigator.to;
  late final back = navigator.back;
  late final toAndRemoveUntil = navigator.toAndRemoveUntil;
  late final dialog = navigator.toDialog;

  /// authentication events
  void authenticated() {
    toAndRemoveUntil(HomePage());
  }

  void unAuthenticated() {
    toAndRemoveUntil(LoginPage());
  }
}
