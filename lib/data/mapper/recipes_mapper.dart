
import '../dto/recipes_dto.dart';
import '../model/recipe.dart';

extension RecipesMapper on RecipeDto {
  Recipe toModel() {
    return Recipe(
      id: (id ?? -1).toInt(),
      name: name ?? 'no name',
      category: category ?? 'no category',
      image: image ?? '',
      chef: chef ?? 'no chef',
      time: time ?? '',
      rating: (rating ?? 0.0).toDouble(),
    );
  }
}
