import 'package:fcps_pearls/domain/models/pearl.dart';
import 'package:fcps_pearls/domain/repositories/pearls_repository.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../../main.dart';

final saveRM = RM.injectForm();

void _put(Pearl p) => pearlsRepository(p);

class AddPearlPage extends UI {
  final pearl = RM.inject(() => Pearl());

  AddPearlPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Pearl - New'.text(),
      ),
      body: ListView(
        children: [
          'Create Pearl'
              .text(
                  // textScaleFactor: 3
                  )
              .pad(),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Statement',
            ),
            onChanged: (statement) {
              // pearl(pearl()..statement = statement);
            },
            maxLines: 6,
            minLines: 2,
          ).pad(),
          TextField(
            decoration: InputDecoration(
              labelText: 'Answer',
            ),
            onChanged: (answer) {
              // pearl(pearl()..answer = answer);
            },
            maxLines: 6,
            minLines: 3,
          ).pad(),
          TextField(
            decoration: InputDecoration(
              labelText: 'Explanation',
            ),
            onChanged: (explanation) {
              // pearl(pearl()..explanation = explanation);
            },
            maxLines: 6,
            minLines: 2,
          ).pad(),
          OnFormSubmissionBuilder(
            listenTo: saveRM,
            onSubmitting: () => CircularProgressIndicator().center(),
            child: ElevatedButton(
              onPressed: () {
                saveRM.submit(
                  () async {
                    // context.of<PearlsNotifier>().put(pearl);
                    // final isSaved = context
                    //     .of<PearlsNotifier>()
                    //     .pearls
                    //     .any((_pearl) => _pearl.id == pearl.id);
                    // if (isSaved) {
                    //   final index = pearl.index(context);

                    //   context.of<StudioModeNotifier>().onIndexChanged(index);
                    //   context.of<NavigationBloc>()
                    //     ..pop()
                    //     ..replacement(StudioModePage());
                    // }
                    _put(pearl.state);
                  },
                );
              },
              child: 'Save Pearl'
                  .text(
                      // textScaleFactor: 2
                      )
                  .pad(),
            ).pad(),
          ),
        ],
      ),
    );
  }
}
