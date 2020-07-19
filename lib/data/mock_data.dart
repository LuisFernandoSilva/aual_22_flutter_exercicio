import 'package:aula_22_flutter_exercicio/models/product.dart';

abstract class MockData {
  static bool edit = false;
  static String imageDefaults =
      'https://www.iconfinder.com/icons/172144/default_file_icon';
  static List<Product> products = [
    Product(
      photo:
          'https://img2.gratispng.com/20180227/ecq/kisspng-mk-2-grenade-weapon-bomb-firing-pin-weapons-material-5a95480da312c3.858459131519732749668.jpg',
      name: 'Granada',
      description: 'Ao atirar no inimigo explode e toca estilhaços',
    ),
    Product(
      photo:
          'https://cdn.azdeespadas.com.br/5341-thickbox_default/pistola-taurus-917-calibre-9mm.jpg',
      name: 'Pistola 9m',
      description: 'Arma de uso para defesa ideal para o uso na rua',
    ),
    Product(
      photo:
          'https://thumbs.dreamstime.com/b/m%C3%ADssil-terra-ar-no-lan%C3%A7ador-%C3%A0-99908155.jpg',
      name: 'Missil terra ar',
      description:
          'Ideal para quem não quer se incomodado com barulho de helicopteros',
    ),
  ];
}
