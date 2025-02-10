import 'package:forui/forui.dart';

import '../../main.dart';
import '../pearls_repository.dart';

final _editPearl = EditPearlBloc();

class EditPearlBloc extends Bloc {
  bool hasChanges = false;
  late Pearl _pearl = pearlsRepository.pearlDetail;

  Pearl get pearl => _pearl;

  set pearl(Pearl value) {
    hasChanges = true;
    _pearl = value;
    notify();
  }

  String statement([String? value]) {
    if (value != null) {
      pearl = pearl..statement = value;
    }
    return pearl.statement;
  }

  String answer([String? value]) {
    if (value != null) {
      pearl = pearl..answer = value;
    }
    return pearl.answer;
  }

  String explanation([String? value]) {
    if (value != null) {
      pearl = pearl..explanation = value;
    }
    return pearl.explanation;
  }

  void save() {
    hasChanges = false;
    pearlsRepository.put(pearl);
    notify();
  }
}

class EditPearlPage extends UI {
  const EditPearlPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader.nested(
        prefixActions: [
          FHeaderAction.back(
            onPress: _editPearl.back,
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
              _editPearl.statement(),
              _editPearl.statement,
              6,
            ),
            SizedBox(height: 16),
            _buildTextField(
              'Answer',
              _editPearl.answer(),
              _editPearl.answer,
              6,
            ),
            SizedBox(height: 16),
            _buildTextField(
              'Explanation',
              _editPearl.explanation(),
              _editPearl.explanation,
              6,
            ),
            FButton(
              onPress: _editPearl.hasChanges
                  ? () {
                      _editPearl.save();
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
    String initialValue,
    Function(String) onChanged,
    int maxLines,
  ) {
    return FTextField(
      initialValue: initialValue,
      label: label.text(),
      onChange: (value) {
        onChanged(value);
      },
      maxLines: maxLines,
      minLines: 2,
    ).pad();
  }
}
