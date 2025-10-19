import 'package:fcps_pearls/domain/models/pearl.dart';
import 'package:fcps_pearls/domain/repositories/study_mode_repository.dart';
import 'package:fcps_pearls/domain/repositories/pearls_repository.dart';
import '../../../main.dart';

mixin StudyModeNotifier {
  final pageController = PageController(initialPage: studyModeRepository.value);

  int get index => studyModeRepository.value;

  String get indexInfo {
    final currentIndex = index + 1;
    final total = pearlsRepository.count();
    return '$currentIndex/$total';
  }

  bool get isFirst => index == 0;
  bool get isLast => index + 1 == pearlsRepository.count();
  Iterable<Pearl> get pearls => pearlsRepository.getAll();

  void onPage(int value) {
    studyModeRepository.setValue(value);
  }
}

class StudyModePage extends UI with StudyModeNotifier {
  StudyModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('STUDY MODE'),
      ),
      body: PageView.builder(
        controller: pageController,
        onPageChanged: onPage,
        itemCount: pearls.length,
        itemBuilder: (context, index) {
          final pearl = pearls.elementAt(index);
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PEARL # ${index + 1}',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  _buildSection(
                    title: 'Statement',
                    content: pearl.statement,
                    icon: Icons.lightbulb_outline,
                  ),
                  SizedBox(height: 20),
                  _buildSection(
                    title: 'Answer',
                    content: pearl.answer,
                    icon: Icons.check_circle_outline,
                  ),
                  SizedBox(height: 20),
                  _buildSection(
                    title: 'Explanation',
                    content: pearl.explanation,
                    icon: Icons.info_outline,
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: isFirst
                  ? null
                  : () => pageController.previousPage(
                        duration: Duration(milliseconds: 200),
                        curve: Curves.decelerate,
                      ),
            ),
            Text(indexInfo),
            IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: isLast
                  ? null
                  : () => pageController.nextPage(
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
    Color color = Colors.blue,
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
