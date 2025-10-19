import 'package:fcps_pearls/domain/models/category.dart';
import 'package:fcps_pearls/main.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class CategoriesRepository extends CRUD<Category> {
  final editing = RM.inject(() => false);
  final category = RM.inject(() => Category());
}

final categoriesRepository = CategoriesRepository();
