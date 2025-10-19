import 'package:fcps_pearls/domain/repositories/categories_repository.dart';
import 'package:fcps_pearls/domain/models/category.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../main.dart';

final categoriesRM = RM.injectStream(
  categoriesRepository.watch,
  initialState: categoriesRepository(),
);

Iterable<Category> get categories => categoriesRM.state;
Injected<bool> get editing => categoriesRepository.editing;

void toggle() {
  editing.state = !editing.state;
}

void put(Category category) {
  categoriesRepository.put(category);
}

class CategoriesPage extends UI {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Categories'.text(),
        actions: [
          IconButton(
            onPressed: () => toggle(),
            icon: Icon(Icons.edit_document),
          ),
          IconButton(
            onPressed: () => put(Category()),
            icon: Icon(Icons.add_box),
          ).pad(),
        ],
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories.elementAt(index);
          return Container(
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(15),
            ),
            height: 60,
            child: editing.state
                ? TextFormField(
                    initialValue: category.name,
                    onChanged: (value) {
                      put(category..name = value);
                    },
                  ).pad()
                : category.name.text().pad(),
          ).pad();
        },
      ),
    );
  }
}
