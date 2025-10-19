import 'package:fcps_pearls/main.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Category extends Model {
  @Id()
  int id = 0;
  String name = '';
}
