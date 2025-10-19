import 'package:fcps_pearls/features/authentication/login_page.dart';
import 'package:fcps_pearls/main.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

final navigator = RM.navigate;

class Navigation {
  GlobalKey<NavigatorState> key = GlobalKey();
  late final navigatorState = key.currentState!;
  late final context = key.currentContext!;
  void to(Widget page) {
    navigatorState.push(
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  void back() {
    navigatorState.pop();
  }

  void toAndRemoveUntil(Widget page) {
    navigatorState.pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => page,
      ),
      (route) => false,
    );
  }

  void dialog(Widget page) {
    showDialog(
      context: context,
      builder: (context) => page,
    );
  }

  /// authentication events
  void authenticated() {
    toAndRemoveUntil(HomePage());
  }

  void unAuthenticated() {
    toAndRemoveUntil(LoginPage());
  }
}
