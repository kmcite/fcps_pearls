import 'package:forui/forui.dart';

import '../main.dart';

String? validateRegisterPassword(String? password) {
  if (password == null || password.isEmpty) {
    return 'Please enter a password';
  }
  if (password.length < 8) {
    return 'Password must be at least 8 characters';
  }
  return null;
}

String? validateRegisterEmail(String? email) {
  if (email == null || email.isEmpty) {
    return 'Please enter an email';
  }
  if (!email.contains('@')) {
    return 'Please enter a valid email';
  }
  return null;
}

final _register = RegisterBloc();

class RegisterBloc extends Bloc {
  bool get obscurePassword => true;

  register() {
    to(HomePage());
  }
}

class RegisterPage extends UI {
  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader(
        title: 'PEARLS'.text(),
        actions: [
          FHeaderAction(
            icon: FIcon(FAssets.icons.arrowLeft),
            onPress: () {
              _register.back();
            },
          ),
        ],
      ),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FTextField(
                label: 'Name'.text(),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validator: validateRegisterEmail,
              ).pad(),
              FTextField.email(
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validator: validateRegisterEmail,
              ).pad(),
              FTextField.password(
                textInputAction: TextInputAction.done,
                validator: validateRegisterPassword,
              ).pad(),
              FButton(
                onPress: () => _register.register(),
                label: const Text('Register'),
              ).pad(),
            ],
          ),
        ],
      ),
    );
  }
}
