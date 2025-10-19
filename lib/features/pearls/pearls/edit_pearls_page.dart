import 'package:fcps_pearls/utils/navigation.dart';
import 'package:forui/forui.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../../main.dart';
import '../../../domain/repositories/pearls_repository.dart';

mixin EditPearlBloc {
  final pearl = pearlsRepository.pearl;
  final hasChanges = RM.inject(() => false);

  final statement = RM.inject(() => '');
  final answer = RM.inject(() => '');
  final explanation = RM.inject(() => '');

  void save() {
    hasChanges.state = (false);
    pearlsRepository.put(pearl.state);
  }
}

class EditPearlPage extends UI with EditPearlBloc {
  EditPearlPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader.nested(
        prefixActions: [
          FHeaderAction.back(
            onPress: navigator.back,
          ),
        ],
        title: Text('Edit Pearl'),
      ),
      content: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTextField(
              'Statement',
              ([value]) {
                if (value != pearl.state.statement) {
                  hasChanges.state = (true);
                }
                return '';
              },
              6,
            ),
            SizedBox(height: 16),
            _buildTextField(
              'Answer',
              ([value]) {
                if (value != pearl.state.statement) {
                  hasChanges.state = (true);
                }
                return '';
              },
              6,
            ),
            SizedBox(height: 16),
            _buildTextField(
              'Explanation',
              ([value]) {
                if (value != pearl.state.statement) {
                  hasChanges.state = (true);
                }
                return '';
              },
              6,
            ),
            FButton(
              onPress: hasChanges.state
                  ? () {
                      save();
                    }
                  : null,
              label: 'Save'.text(),
            ).pad(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    String Function([String?]) onChanged,
    int maxLines,
  ) {
    return FTextField(
      initialValue: onChanged(),
      label: label.text(),
      onChange: (value) {
        onChanged(value);
      },
      maxLines: maxLines,
      minLines: 2,
    ).pad();
  }
}
