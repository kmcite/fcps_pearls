import 'package:fcps_pearls/main.dart';

class SettingsRepository {
  final darkRM = false.inj();
  final studioRM = false.inj();
  bool studio([bool? value]) {
    if (value != null) studioRM.state = value;
    return studioRM.state;
  }

  bool dark([bool? value]) {
    if (value != null) darkRM.state = value;
    return darkRM.state;
  }
}
