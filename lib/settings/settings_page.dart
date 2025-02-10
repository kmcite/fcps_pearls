import 'package:forui/forui.dart';

import '../main.dart';

final _settings = SettingsBloc();

class SettingsBloc extends Bloc {
  late final studio = settings.studio;
  late final dark = settings.dark;

  void toggleStudio() {
    studio(!studio());
  }
}

class SettingsPage extends UI {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader(
        actions: [
          FHeaderAction.x(onPress: () => _settings.back()),
        ],
        title: const Text('Settings'),
      ),
      content: FTileGroup(
        divider: FTileDivider.full,
        children: [
          FTile(
            title: const Text('LIGHT MODE'),
            suffixIcon: _settings.dark() ? null : FIcon(FAssets.icons.check),
            onPress: () {
              _settings.dark(false);
            },
          ),
          FTile(
            title: 'DARK MODE'.text(),
            suffixIcon: _settings.dark() ? FIcon(FAssets.icons.check) : null,
            onPress: () {
              _settings.dark(true);
            },
          ),
          FTile(
            prefixIcon: const Icon(Icons.workspaces),
            title: const Text('ENABLE STUDIO MODE'),
            suffixIcon: FSwitch(
              value: _settings.studio(),
              onChange: _settings.studio,
            ),
            onPress: _settings.toggleStudio,
          ),
        ],
      ),
    );
  }
}
