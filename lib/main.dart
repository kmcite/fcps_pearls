library fcps_pearls;

import 'package:fcps_pearls/objectbox.g.dart';
import 'package:fcps_pearls/utils/navigation.dart';
import 'package:manager/dark/dark_repository.dart';

import 'features/authentication/login_page.dart';
import 'main.dart';
import 'package:forui/forui.dart';

export 'dart:convert';
export 'dart:io';
export 'package:colornames/colornames.dart';
export 'package:fcps_pearls/features/authentication/authentication_bloc.dart';
export 'package:fcps_pearls/features/authentication/register_page.dart';
export 'package:fcps_pearls/features/pearls/exam/exam_mode.dart';
export 'package:fcps_pearls/features/home_page.dart';
export 'package:fcps_pearls/features/pearls/pearls/edit_pearls_page.dart';
export 'package:fcps_pearls/features/pearls/pearls/pearl_details_page.dart';
export 'package:fcps_pearls/features/pearls/pearls/pearls_page.dart';
export 'package:fcps_pearls/features/settings/settings_page.dart';
export 'package:fcps_pearls/features/pearls/studio/add_pearl_page.dart';
export 'package:fcps_pearls/features/pearls/studio/studio_mode_page.dart';
export 'package:fcps_pearls/features/pearls/study/study_mode_page.dart';
export 'package:flutter/material.dart';
export 'package:flutter_native_splash/flutter_native_splash.dart';
export 'package:path_provider/path_provider.dart';
export 'package:manager/manager.dart';

void main() async {
  FlutterNativeSplash.preserve(
    widgetsBinding: WidgetsFlutterBinding.ensureInitialized(),
  );

  runApp(
    PearlsApp(),
    // openStore: openStore,
  );
}

ThemeMode get themeMode => dark ? ThemeMode.dark : ThemeMode.light;
bool get authenticated => false;
bool get dark => darkRepository.state;

class PearlsApp extends UI {
  const PearlsApp({super.key});

  @override
  void didMountWidget(BuildContext context) {
    FlutterNativeSplash.remove();
    super.didMountWidget(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigator.navigatorKey,
      themeMode: themeMode,
      home: authenticated ? HomePage() : LoginPage(),
      builder: (context, child) => FTheme(
        data: dark ? FThemes.rose.dark : FThemes.green.light,
        child: child!,
      ),
    );
  }
}
