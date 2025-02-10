import 'package:fcps_pearls/navigation.dart';

import '../../main.dart';

final _studyMode = StudioMode();

class StudioMode {
  int index = 0;
  onIndexChanged(int value) {
    index = value;
  }

  bool editing = true;
  void toggle() {
    editing = !editing;
  }
}

class StudioModePage extends UI {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final editing = _studyMode.editing;
    return DefaultTabController(
      initialIndex: _studyMode.index,
      length: 0,
      //  context.of<PearlsNotifier>().pearls.length,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                context.of<Navigation>().to(AddPearlPage());
              },
              icon: Icon(Icons.add),
            ),
            IconButton(
              onPressed: () => _studyMode.toggle(),
              icon: Icon(Icons.workspaces_sharp),
            ).pad(),
          ],
          // bottom: TabBar(
          //   isScrollable: true,
          //   onTap: context.of<StudioModeNotifier>().onIndexChanged,
          //   tabs: context.of<PearlsNotifier>().pearls.map(
          //     (pearl) {
          //       return Tab(text: pearl.id.toString());
          //     },
          //   ).toList(),
          // ),
        ),
        // body: TabBarView(
        //   children: context.of<PearlsNotifier>().pearls.map(
        //     (Pearl pearl) {
        //       return Column(
        //         crossAxisAlignment: CrossAxisAlignment.stretch,
        //         children: [
        //           Container(
        //             height: 60,
        //             decoration: BoxDecoration(
        //               border: Border.all(),
        //               borderRadius: BorderRadius.circular(15),
        //             ),
        //             child: editing
        //                 ? TextFormField(
        //                     initialValue: pearl.statement,
        //                     onChanged: (value) => context
        //                         .of<PearlsNotifier>()
        //                         .put(pearl..statement = value),
        //                   )
        //                 : pearl.statement.text(),
        //           ).pad(),
        //           Container(
        //             height: 60,
        //             decoration: BoxDecoration(
        //               border: Border.all(),
        //               borderRadius: BorderRadius.circular(15),
        //             ),
        //             child: editing
        //                 ? TextFormField(
        //                     initialValue: pearl.answer,
        //                     onChanged: (value) => context
        //                         .of<PearlsNotifier>()
        //                         .put(pearl..answer = value),
        //                   )
        //                 : pearl.answer.text(),
        //           ).pad(),
        //           Container(
        //             height: 60,
        //             decoration: BoxDecoration(
        //               border: Border.all(),
        //               borderRadius: BorderRadius.circular(15),
        //             ),
        //             child: editing
        //                 ? TextFormField(
        //                     initialValue: pearl.explanation,
        //                     onChanged: (value) => context
        //                         .of<PearlsNotifier>()
        //                         .put(pearl..explanation = value),
        //                   )
        //                 : pearl.explanation.text(),
        //           ).pad(),
        //           Container(
        //             height: 60,
        //             decoration: BoxDecoration(
        //               border: Border.all(),
        //               borderRadius: BorderRadius.circular(15),
        //             ),
        //             child: Row(
        //               children: [
        //                 PopupMenuButton(
        //                   initialValue: pearl.category.target,
        //                   itemBuilder: (context) => context
        //                       .of<CategoriesNotifier>()
        //                       .categories
        //                       .map(
        //                         (cat) => PopupMenuItem(
        //                           value: cat,
        //                           child: cat.name.text(),
        //                         ),
        //                       )
        //                       .toList(),
        //                   onSelected: (value) => context
        //                       .of<PearlsNotifier>()
        //                       .put(pearl..category.target = value),
        //                 ),
        //                 (pearl.category.target?.name).text()
        //               ],
        //             ),
        //           ).pad(),
        //         ],
        //       );
        //     },
        //   ).toList(),
        // ),
      ),
    );
  }
}
