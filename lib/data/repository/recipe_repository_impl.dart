import 'package:flutter_app/data/core/network_error.dart';
import 'package:flutter_app/data/core/result.dart';
import 'package:flutter_app/data/data_source/recipe_data_source.dart';
import 'package:flutter_app/data/dto/recipes_dto.dart';
import 'package:flutter_app/data/model/recipe.dart';
import 'package:flutter_app/data/repository/recipe_repository.dart';


class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource _datasource;

  RecipeRepositoryImpl(this._datasource);

  @override
  Future<Result<List<Recipe>, NetworkError>> getRecipes() async {
    final response = await _datasource.getRecipes();

    switch (response) {
      case Success<List<RecipesDto>, NetworkError>(data: final dtoList):
        final List allRawRecipes = dtoList
            .expand((dto) => dto.recipes ?? [])
            .toList();

        final recipeModels = allRawRecipes
            .map((rawRecipe) => rawRecipe.toModel()) // Recipes 객체에 정의된 toModel() 호출
            .toList();
        return Result.success<List<Recipe>, NetworkError>(recipeModels);
        case Error<List<RecipesDto>, NetworkError>(error: final error):
        return Result.error(error);
    }
  }
}
