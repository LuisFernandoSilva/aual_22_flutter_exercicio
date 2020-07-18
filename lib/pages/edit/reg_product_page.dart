import 'package:aula_22_flutter_exercicio/models/product.dart';
import 'package:flutter/material.dart';

class RegProductPage extends StatefulWidget {
  static String routeName = '/reg_products';
  @override
  _RegProductPageState createState() => _RegProductPageState();
}

class _RegProductPageState extends State<RegProductPage> {
  Product _product;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _product = ModalRoute.of(context).settings.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro Produto: ${_product?.name ?? ''}'),
        centerTitle: true,
      ),
    );
  }
}
