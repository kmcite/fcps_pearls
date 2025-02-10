import 'package:fcps_pearls/pearls/pearls_repository.dart';
import 'package:forui/forui.dart';

import '../../main.dart';

final _pearlDetails = PearlDetailsBloc();

class PearlDetailsBloc extends Bloc {
  Pearl get pearl => pearlsRepository.pearlDetail;
  final answerRM = RM.inject(() => false);
  bool get answerShown => answerRM.state;
  final explanationRM = RM.inject(() => false);
  bool get explanationShown => explanationRM.state;
}

class PearlDetailsPage extends UI {
  const PearlDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pearl = _pearlDetails.pearl;
    return FScaffold(
      header: FHeader.nested(
        title: Text('${pearl.id}'),
        prefixActions: [
          FHeaderAction.back(
            onPress: _pearlDetails.back,
          ),
        ],
        suffixActions: [
          FButton.icon(
            child: FIcon(FAssets.icons.pen),
            onPress: () {
              _pearlDetails.to(EditPearlPage());
            },
          ),
          FButton.icon(
            child: FIcon(FAssets.icons.link),
            onPress: () {},
          ),
          FButton.icon(
            child: FIcon(FAssets.icons.share),
            onPress: () {
              // Implement share functionality
            },
          ),
        ],
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Statement'),
          Text(pearl.statement),
          _buildExpandableSection(
            title: 'Answer',
            content: pearl.answer,
            isVisible: _pearlDetails.answerShown,
            onToggle: () =>
                _pearlDetails.answerRM.state = !_pearlDetails.answerShown,
          ),
          const SizedBox(height: 24),
          _buildExpandableSection(
            title: 'Explanation',
            content: pearl.explanation,
            isVisible: _pearlDetails.explanationRM.state,
            onToggle: () => _pearlDetails.explanationRM.state =
                !_pearlDetails.explanationRM.state,
          ),
        ],
      ),
    );
  }

  Widget _buildExpandableSection({
    required String title,
    required String content,
    required bool isVisible,
    required VoidCallback onToggle,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        const SizedBox(height: 8),
        AnimatedCrossFade(
          firstChild: FButton(
            onPress: content.isEmpty ? null : onToggle,
            prefix: FIcon(FAssets.icons.bicepsFlexed),
            label: Text('Show $title'),
          ),
          secondChild: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FButton(
                onPress: onToggle,
                prefix: FIcon(FAssets.icons.bicepsFlexed),
                label: Text('Hide $title'),
              ),
              Text(content),
            ],
          ),
          crossFadeState:
              isVisible ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 300),
        ),
      ],
    );
  }
}
