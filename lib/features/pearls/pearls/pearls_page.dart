import 'package:fcps_pearls/features/authentication/login_page.dart';
import 'package:fcps_pearls/main.dart';
import 'package:fcps_pearls/domain/models/pearl.dart';
import 'package:fcps_pearls/domain/repositories/pearls_repository.dart';
import 'package:fcps_pearls/utils/navigation.dart';
import 'package:forui/forui.dart';

mixin PearlsBloc {
  final pearl = pearlsRepository.pearl;

  List<Pearl> get pearls => pearlsRepository.getAll().toList();
  void update(Pearl pearl) {
    pearlsRepository.put(pearl);
  }

  void insert(Pearl pearl) {
    // pearlsRepository.insert(pearl);
  }

  void logout() {
    navigator.toAndRemoveUntil(LoginPage());
  }
}

class PearlsPage extends UI with PearlsBloc {
  PearlsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader(
        title: const Text('Pearls'),
        actions: [
          FHeaderAction.back(
            onPress: navigator.back,
          ),
        ],
      ),
      content: pearls.isEmpty
          ? Center(
              child: Text(
                'No pearls yet. Tap + to add one!',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            )
          : FTileGroup.builder(
              divider: FTileDivider.full,
              count: pearls.length,
              tileBuilder: (context, index) {
                final pearl = pearls.elementAt(index);
                return FTile(
                  title: pearl.text(),
                  onPress: () {
                    // super.pearl(pearl);
                    navigator.to(
                      PearlDetailsPage(),
                    );
                  },
                );
              },
            ),
      footer: FButton(
        onPress: () async {
          navigator.toDialog(_AddNewPearlDialog());
        },
        label: const Icon(Icons.add),
      ).pad(),
    );
  }
}

class _AddNewPearlDialog extends UI {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Placeholder(),
    );
  }
}
