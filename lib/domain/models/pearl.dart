import 'package:objectbox/objectbox.dart';

import '../../main.dart';

@Entity()
class Pearl extends Model {
  @Id()
  int id = 0;
  String statement = '';
  String answer = '';
  String explanation = '';

  bool hidden = false;
}
