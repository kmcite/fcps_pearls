// ignore_for_file: invalid_export_of_internal_element

library fcps_pearls;

export 'dependency_injection.dart';

import 'authentication/login_page.dart';
import 'main.dart';
import 'package:forui/forui.dart';

export 'dart:convert';
export 'dart:io';
export 'package:colornames/colornames.dart';
export 'package:fcps_pearls/authentication/authentication_bloc.dart';
export 'package:fcps_pearls/authentication/register_page.dart';
export 'package:fcps_pearls/pearls/exam/exam_mode.dart';
export 'package:fcps_pearls/home_page.dart';
export 'package:fcps_pearls/pearls/pearls/edit_pearls_page.dart';
export 'package:fcps_pearls/pearls/pearls/pearl_details_page.dart';
export 'package:fcps_pearls/pearls/pearls/pearls_page.dart';
export 'package:fcps_pearls/settings/settings_page.dart';
export 'package:fcps_pearls/pearls/studio/add_pearl_page.dart';
export 'package:fcps_pearls/pearls/studio/studio_mode_page.dart';
export 'package:fcps_pearls/pearls/study/study_mode_page.dart';
export 'package:flutter/material.dart';
export 'package:flutter_native_splash/flutter_native_splash.dart';
export 'package:objectbox/objectbox.dart';
export 'package:package_info_plus/package_info_plus.dart';
export 'package:path_provider/path_provider.dart';
export 'package:manager/manager.dart' hide RouteData, context;

void main() async {
  FlutterNativeSplash.preserve(
    widgetsBinding: WidgetsFlutterBinding.ensureInitialized(),
  );
  await RM.storageInitializer(HiveStorage());
  runApp(PearlsApp());
}

final _pearlsApp = PearlsAppBloc();

class PearlsAppBloc extends Bloc {
  GlobalKey<NavigatorState> get key => navigation.key;
  ThemeMode get themeMode => settings.dark() ? ThemeMode.dark : ThemeMode.light;
  bool get authenticated => false;
  bool get dark => settings.dark();
}

class PearlsApp extends UI {
  @override
  void didMountWidget(BuildContext context) {
    super.didMountWidget(context);
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: _pearlsApp.key,
      themeMode: _pearlsApp.themeMode,
      home: _pearlsApp.authenticated ? HomePage() : LoginPage(),
      builder: (context, child) => FTheme(
        data: _pearlsApp.dark ? FThemes.rose.dark : FThemes.green.light,
        child: child!,
      ),
    );
  }
}
