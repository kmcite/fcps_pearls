import 'package:fcps_pearls/authentication/login_page.dart';
import 'package:fcps_pearls/main.dart';
import 'package:fcps_pearls/pearls/pearls_repository.dart';
import 'package:forui/forui.dart';

final _pearls = PearlsBloc();

class PearlsBloc extends Bloc {
  Pearl get detailPearl => pearlsRepository.pearlDetail;

  set detailPearl(Pearl value) {
    pearlsRepository.pearlDetail = value;
  }

  List<Pearl> get pearls => pearlsRepository.getAll().toList();
  void put(Pearl pearl) {
    pearlsRepository.put(pearl);
  }

  void logout() {
    toAndRemoveUntil(LoginPage());
  }
}

class PearlsPage extends UI {
  const PearlsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader(
        title: const Text('Pearls'),
        actions: [
          FHeaderAction.back(
            onPress: _pearls.back,
          ),
        ],
      ),
      content: _pearls.pearls.isEmpty
          ? Center(
              child: Text(
                'No pearls yet. Tap + to add one!',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            )
          : FTileGroup.builder(
              divider: FTileDivider.full,
              count: _pearls.pearls.length,
              tileBuilder: (context, index) {
                final pearl = _pearls.pearls.elementAt(index);
                return FTile(
                  title: pearl.text(),
                  onPress: () {
                    _pearls.detailPearl = pearl;
                    _pearls.to(
                      PearlDetailsPage(),
                    );
                  },
                );
              },
            ),
      footer: FButton(
        onPress: () async {
          final pearl = _pearls.dialog<Pearl>(_AddNewPearlDialog());
          if (pearl != null) {}
          _pearls.put(Pearl());
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

extension IndexOnPearl on Pearl {
  int index(BuildContext context) {
    return _pearls.pearls.indexWhere(
      (pearl) {
        return pearl.id == id;
      },
    );
  }
}
