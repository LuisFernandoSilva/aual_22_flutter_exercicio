import 'package:aula_22_flutter_exercicio/models/product.dart';

abstract class MockData {
  final List<Product> products = [
    Product(
      photo:
          'https://www.freepngs.com/grenade-pngs?pgid=izrbv0ev-3446d610-5461-11e8-a9ff-063f49e9a7e4',
      name: 'Granada',
      description: 'Ao atirar no inimigo explode e toca estilhaços',
    ),
    Product(
      photo:
          'https://www.freepngs.com/handgun-pngs?pgid=izrbzjjx-344ba5ea-5461-11e8-a9ff-063f49e9a7e4',
      name: 'Pistola 9m',
      description: 'Arma de uso para defesa ideal para o uso na rua',
    ),
    Product(
      photo:
          'https://www.freepngs.com/rocket-pngs?pgid=izrcb3ll-3459b33c-5461-11e8-a9ff-063f49e9a7e4',
      name: 'Missil terra ar',
      description:
          'Ideal para quem não quer se incomodado com barulho de helicopteros',
    ),
  ];
}
