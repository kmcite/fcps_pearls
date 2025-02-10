import 'package:fcps_pearls/main.dart';
import 'package:fcps_pearls/categories/category.dart';

class CategoriesRepository extends Collection<Category> {
  CategoriesRepository() : super(fromJson: Category.fromJson);

  final editingRM = false.inj();
  bool get editing => editingRM.state;
  void setEditing(bool value) {
    editingRM.state = value;
  }
}
