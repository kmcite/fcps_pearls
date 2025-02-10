import 'package:fcps_pearls/authentication/login_page.dart';
import 'package:forui/forui.dart';

import 'main.dart';

final _homeBloc = HomeBloc();

class HomeBloc extends Bloc {
  bool get studioMode => settings.dark();
  logout() {
    toAndRemoveUntil(LoginPage());
  }
}

class HomePage extends UI {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FScaffold(
      header: FHeader(
        title: const Text('PEARLS'),
        actions: [
          FButton.icon(
            child: const Icon(Icons.logout),
            style: FButtonStyle.destructive,
            onPress: () => _homeBloc.logout(),
          ),
        ],
      ),
      content: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: [
          _buildFeatureButton(
            context,
            'Study Mode',
            FAssets.icons.school,
            StudyModePage(),
            theme.colorScheme.primary,
          ),
          _buildFeatureButton(
            context,
            'Exam Mode',
            FAssets.icons.quote,
            ExamModePage(),
            theme.colorScheme.secondary,
          ),
          _buildFeatureButton(
            context,
            'Pearls',
            FAssets.icons.diamond,
            PearlsPage(),
            theme.colorScheme.tertiary,
          ),
          if (_homeBloc.studioMode)
            _buildFeatureButton(
              context,
              'Studio',
              FAssets.icons.pen,
              StudioModePage(),
              theme.colorScheme.error,
            ),
          _buildFeatureButton(
            context,
            'Settings',
            FAssets.icons.settings,
            SettingsPage(),
            theme.colorScheme.primary,
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureButton(
    BuildContext context,
    String title,
    SvgAsset icon,
    Widget page,
    Color color,
  ) {
    return FButton(
      onPress: () => _homeBloc.to(page),
      label: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FIcon(
            icon,
            size: 48,
          ),
          const SizedBox(height: 12),
          Text(
            title,
          ),
        ],
      ),
    );
  }
}
