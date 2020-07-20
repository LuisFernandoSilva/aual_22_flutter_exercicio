import 'package:aula_22_flutter_exercicio/models/product.dart';

abstract class MockData {
  static bool edit = false;

  static List<Product> products = [
    Product(
      photo: 'assets/granada.jpg',
      name: 'Granada',
      description: 'Ao atirar no inimigo explode e toca estilhaços',
    ),
    Product(
      photo: 'assets/pistola.jpg',
      name: 'Pistola 9m',
      description: 'Arma de uso para defesa ideal para o uso na rua',
    ),
    Product(
      photo: 'assets/missel.jpg',
      name: 'Missil terra ar',
      description:
          'Ideal para quem não quer se incomodado com barulho de helicopteros',
    ),
  ];
}
