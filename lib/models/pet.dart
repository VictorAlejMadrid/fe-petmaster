class PetModel {
  final int id;
  final String name;
  final String species;
  final String breed;
  final int age;
  final double weight;
  final int size;

  PetModel({
    required this.id,
    required this.name,
    required this.species,
    required this.breed,
    required this.age,
    required this.weight,
    required this.size,
  });

  factory PetModel.fromJson(Map<String, dynamic> json) {
    return PetModel(
      id: json['id'] as int,
      name: json['name'] as String,
      species: json['species'] as String,
      breed: json['breed'] as String,
      age: json['age'] as int,
      weight: (json['weight'] as num).toDouble(),
      size: json['size'] as int,
    );
  }
}
