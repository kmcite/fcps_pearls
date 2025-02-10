import 'package:fcps_pearls/main.dart';

import '../categories/category.dart';

class PearlsRepository extends Collection<Pearl> {
  PearlsRepository() : super(fromJson: Pearl.fromJson);
  final pearlDetailRM = RM.inject<String>(() => "");
  Pearl get pearlDetail => get(pearlDetailRM.state) ?? Pearl.none();
  set pearlDetail(Pearl value) {
    pearlDetailRM.state = value.id;
  }
}

class Pearl extends Model {
  String statement = '';
  String answer = '';
  String explanation = '';
  String _category = '{}';
  Category get category {
    try {
      return Category.fromJson(jsonDecode(_category));
    } catch (e) {
      return Category.none();
    }
  }

  bool hidden = false;

  set category(Category value) => _category = jsonEncode(value.toJson());

  Pearl();
  Pearl.none() {
    id = '';
  }
  Pearl.fromJson(JSON json) {
    id = json['id'] ?? '';
    statement = json['statement'] ?? '';
    answer = json['answer'] ?? '';
    explanation = json['explanation'] ?? '';
    _category = json['_category'] ?? '';
  }
}
