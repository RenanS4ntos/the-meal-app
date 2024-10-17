class Ingredient {
  final String name;
  final String measure;

  Ingredient({
    required this.name,
    required this.measure,
  });

  factory Ingredient.fromJson(String name, String measure) {
    return Ingredient(
      name: name,
      measure: measure,
    );
  }
}
