import '../core/network_error.dart';
import '../core/result.dart';
import '../model/recipe.dart';

abstract interface class RecipeRepository {
  Future<Result<List<Recipe>, NetworkError>> getRecipes();
}
