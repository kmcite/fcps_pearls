import 'package:fcps_pearls/domain/repositories/categories_repository.dart';
import 'package:fcps_pearls/domain/models/category.dart';
import 'package:fcps_pearls/domain/models/pearl.dart';
import 'package:fcps_pearls/domain/repositories/pearls_repository.dart';
import 'package:fcps_pearls/utils/navigation.dart';
import 'package:forui/forui.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../../main.dart';

final _editing = RM.inject(() => true);

Iterable<Pearl> get _pearls => _pearlsRM.state;
Iterable<Category> get categories => categoriesRepository.getAll();

void toggle() => _editing.toggle();

void _put(Pearl pearl) {
  pearlsRepository.put(pearl);
}

final _pearlsRM = RM.injectStream<List<Pearl>>(
  pearlsRepository.watch,
  initialState: pearlsRepository(),
  sideEffects: SideEffects.onData((data) {
    _tabIndexRM.length = data.length == 0 ? 1 : data.length;
  }),
);

final _tabIndexRM = RM.injectTabPageView(
  length: pearlsRepository.getAll().length,
);

class StudioModePage extends UI {
  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader.nested(
        prefixActions: [
          FButton.icon(
            onPress: navigator.back,
            child: FIcon(FAssets.icons.arrowLeft),
          ),
        ],
        suffixActions: [
          FButton.icon(
            onPress: () {
              navigator.to(AddPearlPage());
            },
            child: FIcon(FAssets.icons.plus),
          ),
          FButton.icon(
            onPress: () => toggle(),
            child: FIcon(FAssets.icons.workflow),
          ).pad(),
        ],
        title: 'STUDIO'.text(),
      ),
      content: FTabs(
        // isScrollable: true,
        onPress: (_) => _tabIndexRM.index = _,
        tabs: _pearls.isEmpty
            ? [
                FTabEntry(
                  label: 'No pearls'.text(),
                  content: 'Bye bye'.text(),
                ),
              ]
            : _pearls.map(
                (pearl) {
                  return FTabEntry(
                    label: pearl.id.toString().text(),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _editing.state
                            ? FTextField(
                                initialValue: pearl.statement,
                                onChange: (value) =>
                                    _put(pearl..statement = value),
                              )
                            : pearl.statement.text().pad(),
                        _editing.state
                            ? FTextField(
                                initialValue: pearl.answer,
                                onChange: (value) =>
                                    _put(pearl..answer = value),
                              )
                            : pearl.answer.text().pad(),
                        _editing.state
                            ? FTextField(
                                initialValue: pearl.explanation,
                                onChange: (value) =>
                                    _put(pearl..explanation = value),
                              )
                            : pearl.explanation.text().pad(),
                        // Row(
                        //   children: [
                        //     PopupMenuButton(
                        //       initialValue: pearl.category,
                        //       itemBuilder: (context) => categories
                        //           .map(
                        //             (cat) => PopupMenuItem(
                        //               value: cat,
                        //               child: cat.name.text(),
                        //             ),
                        //           )
                        //           .toList(),
                        //       onSelected: (value) =>
                        //           put(pearl..category = value),
                        //     ),
                        //     (pearl.category.name).text()
                        //   ],
                        // ).pad(),
                      ],
                    ),
                  );
                },
              ).toList(),
      ),
    );
  }
}

// get-command -name @("flutter", "git")
// $env:FLUTTER_ROOT = "C:\Adn\bin"
// & "$env:FLUTTER_ROOT\bin\internal\shared.bat"
// write-output $?
