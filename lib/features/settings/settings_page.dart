import 'package:fcps_pearls/domain/repositories/settings_repository.dart';
import 'package:fcps_pearls/utils/navigation.dart';
import 'package:forui/forui.dart';
import 'package:manager/dark/dark_repository.dart';

import '../../main.dart';

mixin class SettingsBloc {}

bool get studio => studioRepository.state;
bool get dark => darkRepository.state;

void toggleStudio() {
  studioRepository.state = !studio;
}

void toggleDark() {
  darkRepository.state = !dark;
}

class SettingsPage extends UI with SettingsBloc {
  SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader(
        actions: [
          FHeaderAction.x(
            onPress: () => navigator.back(),
          ),
        ],
        title: const Text('Settings'),
      ),
      content: FTileGroup(
        divider: FTileDivider.full,
        children: [
          FTile(
            title: const Text('LIGHT MODE'),
            suffixIcon: dark ? null : FIcon(FAssets.icons.check),
            onPress: toggleDark,
          ),
          FTile(
            title: 'DARK MODE'.text(),
            suffixIcon: dark ? FIcon(FAssets.icons.check) : null,
            onPress: toggleDark,
          ),
          FTile(
            prefixIcon: const Icon(Icons.workspaces),
            title: const Text('ENABLE STUDIO MODE'),
            suffixIcon: FSwitch(
              value: studio,
              onChange: (_) => toggleStudio(),
            ),
            onPress: toggleStudio,
          ),
        ],
      ),
    );
  }
}
