import 'package:forui/forui.dart';

import '../../main.dart';
import '../pearls_repository.dart';

final _examMode = ExamModeBloc();

class ExamModeBloc extends Bloc {
  Iterable<Pearl> get pearls => pearlsRepository.getAll();

  void put(Pearl pearl) {
    pearlsRepository.put(pearl);
    notify();
  }
}

class ExamModePage extends UI {
  const ExamModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader.nested(
        prefixActions: [
          FHeaderAction(
            onPress: () => _examMode.back(),
            icon: FIcon(FAssets.icons.arrowLeft),
          ),
        ],
        title: const Text('EXAM MODE'),
      ),
      content: PageView.builder(
        itemCount: _examMode.pearls.length,
        itemBuilder: (context, index) {
          final pearl = _examMode.pearls.elementAt(index);
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
                    _examMode.put(pearl..hidden = hidden);
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
