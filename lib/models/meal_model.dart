class MealModel {
  final String id;
  final String title;
  final String image;
  final String description;
  final String category;

  MealModel({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
    required this.category,
  });

  // Converter o JSON em um objeto produto
  factory MealModel.fromJson(Map<String, dynamic> json) {
    return MealModel(
      id: json['idMeal'],
      title: json['strMeal'],
      image: json['strMealThumb'],
      description: json['strInstructions'],
      category: json['strCategory'],
    );
  }
}
