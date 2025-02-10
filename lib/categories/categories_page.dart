import 'package:fcps_pearls/categories/category.dart';

import '../main.dart';

final _categories = CategoriesBloc();

class CategoriesBloc extends Bloc {
  Iterable<Category> get categories => categoriesRepository.getAll();

  bool get editing => categoriesRepository.editing;

  void toggle() => categoriesRepository.editingRM.toggle();

  void put(Category category) {
    categoriesRepository.put(category);
  }
}

class CategoriesPage extends UI {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Categories'.text(),
        actions: [
          IconButton(
            onPressed: () => context.of<CategoriesBloc>().toggle(),
            icon: Icon(Icons.edit_document),
          ),
          IconButton(
            onPressed: () => context.of<CategoriesBloc>().put(
                  Category(),
                ),
            icon: Icon(Icons.add_box),
          ).pad(right: 8)
        ],
      ),
      body: ListView.builder(
        itemCount: context.of<CategoriesBloc>().categories.length,
        itemBuilder: (context, index) {
          final category =
              context.of<CategoriesBloc>().categories.elementAt(index);
          return Container(
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(15),
            ),
            height: 60,
            child: context.of<CategoriesBloc>().editing
                ? TextFormField(
                    initialValue: category.name,
                    onChanged: (value) {
                      context.of<CategoriesBloc>().put(category..name = value);
                    },
                  ).pad()
                : category.name.text().pad(),
          ).pad();
        },
      ),
    );
  }
}
