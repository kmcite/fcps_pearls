import 'package:fcps_pearls/domain/repositories/pearls_repository.dart';
import 'package:fcps_pearls/utils/navigation.dart';
import 'package:forui/forui.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../../main.dart';

mixin PearlDetailsBloc {
  final pearl = pearlsRepository.pearl;
  final answerShown = RM.inject(() => false);
  final explanationShown = RM.inject(() => false);
}

class PearlDetailsPage extends UI with PearlDetailsBloc {
  PearlDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader.nested(
        title: Text('${pearl.state.id}'),
        prefixActions: [
          FHeaderAction.back(
            onPress: navigator.back,
          ),
        ],
        suffixActions: [
          FButton.icon(
            child: FIcon(FAssets.icons.pen),
            onPress: () {
              navigator.to(EditPearlPage());
            },
          ),
          FButton.icon(
            child: FIcon(FAssets.icons.link),
            onPress: () {},
          ),
          FButton.icon(
            child: FIcon(FAssets.icons.share),
            onPress: () {},
          ),
        ],
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Statement'),
          Text(pearl.state.statement),
          _buildExpandableSection(
            title: 'Answer',
            content: pearl.state.answer,
            isVisible: true,
            onToggle: () {
              // answerShown(!answerShown());
            },
          ),
          const SizedBox(height: 24),
          _buildExpandableSection(
            title: 'Explanation',
            content: pearl.state.explanation,
            isVisible: true,
            onToggle: () {
              // explanationShown(!explanationShown());
            },
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
