import 'package:flutter/material.dart';

// Enum para facilitar a passagem do gênero do pet
enum PetGender { male, female }

class PetProfileCard extends StatelessWidget {
  final String? imageUrl;
  final String name;
  final int ageInYears;
  final int weightInKg;
  final PetGender gender;
  final String breed;
  final String? description;
  final int numIcons;

  const PetProfileCard({
    super.key,
    this.imageUrl,
    required this.name,
    required this.ageInYears,
    required this.weightInKg,
    required this.gender,
    required this.breed,
    this.description,
    required this.numIcons,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 270),
      // Decoração principal do Card
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: Colors.blue.shade200, // Borda azul clara
          width: 2.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Coluna da Esquerda: Imagem
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(imageUrl ?? 'https://via.placeholder.com/80'),
            backgroundColor: Colors.grey[200],
          ),
          const SizedBox(width: 16.0),

          // Coluna da Direita: Informações
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nome do Pet
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8.0),

                // Idade, Peso e Gênero
                Row(
                  children: [
                    Text(
                      '$ageInYears ano(s) • $weightInKg kg',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Icon(
                      gender == PetGender.female ? Icons.female : Icons.male,
                      color:
                          gender == PetGender.female
                              ? Colors.pink.shade300
                              : Colors.blue.shade300,
                      size: 18,
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),

                // Raça e Nível de Fofura (ícones de patinha)
                Row(
                  children: [
                    // Tag da Raça
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 4.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green.shade100,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        breed,
                        style: TextStyle(
                          color: Colors.green.shade800,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const Spacer(), // Ocupa o espaço para empurrar as patinhas para a direita
                    Row(
                      children: List.generate(numIcons, (index) {
                        return const Icon(
                          Icons.pets,
                          color: Colors.black54,
                          size: 20,
                        );
                      }),
                    ),
                  ],
                ),
                const SizedBox(height: 12.0),

                // Divisor
                Divider(color: Colors.grey.shade200),
                const SizedBox(height: 8.0),

                // Descrição
                Text(
                  description ?? 'Nenhuma descrição disponível.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade700,
                    height: 1.4,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
