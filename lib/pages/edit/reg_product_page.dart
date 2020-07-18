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
        title: Text('Cadastro Produto'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                ),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: FadeInImage(
                    placeholder: AssetImage('assets/loading.gif'),
                    image: NetworkImage(_product?.photo ?? ''),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.photo_camera),
                    label: Text('Tirar'),
                  ),
                  SizedBox(width: 8),
                  RaisedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.photo_library),
                    label: Text('Galeria'),
                  ),
                ],
              ),
              Divider(),
              Text(
                'Nome: ${_product?.name ?? ''}',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 8),
              Text(
                '${_product?.description ?? ''}',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
