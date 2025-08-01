import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.freezed.dart';

@freezed
abstract class Recipe with _$Recipe {
  const factory Recipe({
    required int id,
    required String category,
    required String name,
    required String image,
    required String chef,
    required String time,
    required double rating,
  }) = _Recipe;
}
