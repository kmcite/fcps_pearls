import 'package:fcps_pearls/main.dart';
import 'package:fcps_pearls/navigation.dart';
import 'package:fcps_pearls/pearls/pearls_repository.dart';

class PearlCard extends UI {
  const PearlCard({super.key, required this.pearl});
  final Pearl pearl;
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: InkWell(
        onTap: () {
          context.of<Navigation>().to(PearlDetailsPage());
        },
        borderRadius: BorderRadius.circular(16.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: colorScheme.primary,
                    child: Text(
                      '${pearl.index(context) + 1}',
                      style: TextStyle(
                        color: colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    radius: 24.0,
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: Text(
                      pearl.statement,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Text(
                'tap to view details',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: colorScheme.secondary),
              ),
              const SizedBox(height: 8.0),
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () {
                    // pearlsBloc.add(RemovePearl(pearl.id));
                    // context.of<PearlsNotifier>().remove(pearl.id);
                  },
                  icon: const Icon(Icons.delete),
                  color: colorScheme.error,
                  tooltip: 'Delete pearl',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
