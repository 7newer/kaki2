import 'package:flutter_app/data/dto/recipes_dto.dart';

import '../model/recipe.dart';

extension RecipesMapper on Recipes {
  Recipe toModel() {
    return Recipe(
      category: category ?? 'no category',
      id: (id ?? -1).toInt(),
      name: name ?? 'no name',
      image: image ?? '',
      chef: chef ?? 'no chef',
      time: time ?? '0 min',
      rating: (rating ?? 0.0).toDouble(),
    );
  }
}
