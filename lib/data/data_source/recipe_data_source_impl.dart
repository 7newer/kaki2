import 'dart:convert';

import 'package:flutter_app/data/core/result.dart';
import 'package:flutter_app/data/data_source/recipe_data_source.dart';
import 'package:flutter_app/data/mapper/recipes_mapper.dart';

import '../core/network_error.dart';
import '../dto/recipes_dto.dart';
import 'package:http/http.dart' as http;

class RecipeDataSourceImpl implements RecipeDataSource {
  final _baseUrl =
      'https://raw.githubusercontent.com/junsuk5/mock_json/main/recipe/recipes.json';

  http.Client _client;

  RecipeDataSourceImpl({http.Client? client})
    : _client = client ?? http.Client();

  @override
  Future<Result<List<RecipesDto>, NetworkError>> getRecipes() async {
    try {
      final response = await _client.get(Uri.parse('$_baseUrl'));

      switch (response.statusCode) {
        case 200:
          final recipes = (jsonDecode(response.body) as List)
              .map((e) => RecipesDto.fromJson(e))
              .toList();
          return Result.success(recipes ?? []);
        case 401:
          return Result.error(NetworkError.unauthorized);
        case 404:
          return Result.error(NetworkError.notFound);
        case 500:
          return Result.error(NetworkError.serverError);
        default:
          return Result.error(NetworkError.unknown);
      }
    } catch (e) {
      return Result.error(NetworkError.unknown);
    }
  }
}
