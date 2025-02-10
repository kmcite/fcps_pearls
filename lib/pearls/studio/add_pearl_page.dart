import 'package:fcps_pearls/pearls/pearls_repository.dart';

import '../../main.dart';

class AddPearlPage extends UI {
  final pearlRM = RM.inject(() => Pearl());
  Pearl get pearl => pearlRM.state;
  void setPearl(Pearl _) => pearlRM.state = _;
  static final saveRM = RM.injectForm();

  AddPearlPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Pearl - New'.text(),
      ),
      body: ListView(
        children: [
          'Create Pearl'.text(textScaleFactor: 3).pad(),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Statement',
            ),
            onChanged: (statement) {
              setPearl(pearl..statement = statement);
            },
            maxLines: 6,
            minLines: 2,
          ).pad(),
          TextField(
            decoration: InputDecoration(
              labelText: 'Answer',
            ),
            onChanged: (answer) {
              setPearl(pearl..answer = answer);
            },
            maxLines: 6,
            minLines: 3,
          ).pad(),
          TextField(
            decoration: InputDecoration(
              labelText: 'Explanation',
            ),
            onChanged: (explanation) {
              setPearl(pearl..explanation = explanation);
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
                  },
                );
              },
              child: 'Save Pearl'.text(textScaleFactor: 2).pad(),
            ).pad(),
          ),
        ],
      ),
    );
  }
}
