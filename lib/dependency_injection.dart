// ignore_for_file: invalid_export_of_internal_element

import 'package:fcps_pearls/authentication/authentication_repository.dart';
import 'package:fcps_pearls/categories/categories_repository.dart';
import 'package:fcps_pearls/main.dart';
import 'package:fcps_pearls/navigation.dart';
import 'package:fcps_pearls/pearls/pearls_repository.dart';
import 'package:fcps_pearls/settings/settings_repository.dart';

typedef UI = ReactiveStatelessWidget;
typedef JSON = Map<String, dynamic>;

final _categories_ = CategoriesRepository();
final _pearls_ = PearlsRepository();
final _navigation_ = Navigation();
final _settings_ = SettingsRepository();
final _authentication_ = AuthenticationRepository();

final notifierRM = RM.inject(() => 0, autoDisposeWhenNotUsed: false);

abstract class Bloc {
  Bloc() {}
  void notify() {
    notifierRM
      ..state = notifierRM.state + 1
      ..notify();
  }

  CategoriesRepository get categoriesRepository => _categories_;
  PearlsRepository get pearlsRepository => _pearls_;
  SettingsRepository get settings => _settings_;
  Navigation get navigation => _navigation_;
  AuthenticationRepository get authentication => _authentication_;
  late final to = _navigation_.to;
  late final back = _navigation_.back;
  late final toAndRemoveUntil = _navigation_.toAndRemoveUntil;
  late final dialog = _navigation_.dialog;
}
