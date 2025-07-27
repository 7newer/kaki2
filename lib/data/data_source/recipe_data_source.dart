import 'package:flutter_app/data/core/result.dart';
import 'package:flutter_app/data/dto/recipes_dto.dart';

import '../core/network_error.dart';

abstract interface class RecipeDataSource {
  Future<Result<List<RecipesDto>, NetworkError>> getRecipes();
}
