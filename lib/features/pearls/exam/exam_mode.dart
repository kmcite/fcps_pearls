import 'package:fcps_pearls/domain/models/pearl.dart';
import 'package:fcps_pearls/utils/navigation.dart';
import 'package:forui/forui.dart';

import '../../../main.dart';
import '../../../domain/repositories/pearls_repository.dart';

mixin ExamModeBloc {
  Iterable<Pearl> get pearls => pearlsRepository.getAll();

  void update(Pearl pearl) {
    pearlsRepository.put(pearl);
  }

  void insert(Pearl pearl) {
    pearlsRepository.put(pearl);
  }
}

class ExamModePage extends UI with ExamModeBloc {
  const ExamModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader.nested(
        prefixActions: [
          FHeaderAction(
            onPress: () => navigator.back(),
            icon: FIcon(FAssets.icons.arrowLeft),
          ),
        ],
        title: const Text('EXAM MODE'),
      ),
      content: PageView.builder(
        itemCount: pearls.length,
        itemBuilder: (context, index) {
          final pearl = pearls.elementAt(index);
          final hidden = pearl.hidden;
          return Column(
            children: [
              Text(
                'Question ${index + 1}',
              ),
              if (hidden) ...[
                Text(pearl.answer),
                Text(pearl.explanation),
                Text(pearl.statement),
                FButton(
                  onPress: () {
                    update(pearl..hidden = hidden);
                  },
                  label: Text(
                    hidden ? 'Show Answer' : 'Hide Answer',
                  ),
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}
