import 'package:fcps_pearls/utils/navigation.dart';
import 'package:forui/forui.dart';

import '../../main.dart';

void login() {
  navigator.to(HomePage());
}

/// validators
String? validatePassword(String? password) {
  if (password == null || password.isEmpty) {
    return 'Please enter a password';
  }
  if (password.length < 8) {
    return 'Password must be at least 8 characters';
  }
  return null;
}

String? validateEmail(String? email) {
  if (email == null || email.isEmpty) {
    return 'Please enter an email';
  }
  if (!email.contains('@')) {
    return 'Please enter a valid email';
  }
  return null;
}

class LoginPage extends UI {
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader(
        title: 'PEARLS'.text(),
        actions: [
          FHeaderAction(
            icon: FIcon(FAssets.icons.userCheck),
            onPress: () {
              navigator.to(RegisterPage());
            },
          ),
        ],
      ),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FTextField.email(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            validator: validateEmail,
            onChange: (value) {},
          ).pad(),
          FTextField.password(
            textInputAction: TextInputAction.done,
            onChange: (_) {},
            validator: validatePassword,
          ).pad(),
          FButton(
            onPress: login,
            label: const Text('Login'),
          ).pad(),
        ],
      ),
    );
  }
}
