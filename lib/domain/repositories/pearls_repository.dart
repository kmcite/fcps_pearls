import 'package:fcps_pearls/main.dart';
import 'package:fcps_pearls/domain/models/pearl.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

final pearlsRepository = PearlsRepository();

class PearlsRepository extends CRUD<Pearl> {
  final pearl = RM.inject(() => Pearl());
}
