import '../core/response.dart';
import '../dto/recipes_dto.dart';

abstract interface class RecipeDataSource {
  Future<Response<RecipesResultDto>> getRecipes();
}
