import '../../main.dart';
import '../pearls_repository.dart';
import 'study_mode_repository.dart';

class StudyModeNotifier extends ChangeNotifier {
  StudyModeRepository get studyModeRepository => context.of();
  PearlsRepository get pearlsRepository => context.of();
  final BuildContext context;
  StudyModeNotifier(this.context) {
    pageController = PageController(initialPage: studyModeRepository.value);
  }
  late PageController pageController;

  int get index => studyModeRepository.value;

  String get indexInfo {
    final currentIndex = index + 1;
    final total = pearlsRepository.count();
    return '$currentIndex/$total';
  }

  bool get isFirst => index == 0;
  bool get isLast => index + 1 == pearlsRepository.count();

  void onPage(int value) {
    studyModeRepository.setValue(value);
    notifyListeners();
  }
}

class StudyModePage extends UI {
  const StudyModePage({super.key});
  @override
  void didUnmountWidget() {
    super.didUnmountWidget();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('STUDY MODE'),
      ),
      // body: PageView.builder(
      //   controller: context.of<StudyModeNotifier>().pageController,
      //   onPageChanged: context.of<StudyModeNotifier>().onPage,
      //   itemCount: context.of<PearlsNotifier>().count(),
      //   itemBuilder: (context, index) {
      //     final pearl = context.of<PearlsNotifier>().pearls.elementAt(index);
      //     return SingleChildScrollView(
      //       child: Padding(
      //         padding: const EdgeInsets.all(16.0),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Text(
      //               'PEARL # ${index + 1}',
      //               style: TextStyle(
      //                 fontSize: 24,
      //                 fontWeight: FontWeight.bold,
      //                 color: context.of<SettingsBloc>().settings.materialColor,
      //               ),
      //             ),
      //             SizedBox(height: 20),
      //             _buildSection(
      //               title: 'Statement',
      //               content: pearl.statement,
      //               icon: Icons.lightbulb_outline,
      //               color: context.of<SettingsBloc>().settings.materialColor,
      //             ),
      //             SizedBox(height: 20),
      //             _buildSection(
      //               title: 'Answer',
      //               content: pearl.answer,
      //               icon: Icons.check_circle_outline,
      //               color: context.of<SettingsBloc>().settings.materialColor,
      //             ),
      //             SizedBox(height: 20),
      //             _buildSection(
      //               title: 'Explanation',
      //               content: pearl.explanation,
      //               icon: Icons.info_outline,
      //               color: context.of<SettingsBloc>().settings.materialColor,
      //             ),
      //           ],
      //         ),
      //       ),
      //     );
      //   },
      // ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: context.of<StudyModeNotifier>().isFirst
                  ? null
                  : () => context
                      .of<StudyModeNotifier>()
                      .pageController
                      .previousPage(
                        duration: Duration(milliseconds: 200),
                        curve: Curves.decelerate,
                      ),
            ),
            Text(context.of<StudyModeNotifier>().indexInfo),
            IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: context.of<StudyModeNotifier>().isLast
                  ? null
                  : () =>
                      context.of<StudyModeNotifier>().pageController.nextPage(
                            duration: Duration(milliseconds: 200),
                            curve: Curves.decelerate,
                          ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required String content,
    required IconData icon,
    required Color color,
  }) {
    return Card(
      elevation: 4,
      color: color.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: color),
                SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              content,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
