import 'package:fcps_pearls/main.dart';
import 'package:fcps_pearls/pearls/pearls_repository.dart';

@Entity()
class Category extends Model {
  String name = '';
  String _pearls = '[]';

  List<Pearl> get pearls {
    try {
      return (jsonDecode(_pearls) as List)
          .map((any) => Pearl.fromJson(any))
          .toList();
    } catch (e) {
      return [];
    }
  }

  Category.fromJson(JSON json) {
    id = json['id'] ?? '';
    name = json['name'] ?? '';
    _pearls = json['_pearls'] ?? '{}';
    id = json['id'] ?? '';
  }
  Category.none();
  Category();
}
