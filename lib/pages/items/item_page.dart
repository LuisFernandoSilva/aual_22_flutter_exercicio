import 'package:aula_22_flutter_exercicio/data/mock_data.dart';
import 'package:aula_22_flutter_exercicio/pages/edit/reg_product_page.dart';
import 'package:flutter/material.dart';

class ItemPage extends StatefulWidget {
  static String routeName = '/items';
  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produtos '),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 16 / 9,
          ),
          itemCount: MockData.products.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(RegProductPage.routeName,
                    arguments: MockData.products[index]);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: FadeInImage(
                  placeholder: AssetImage("asset/loading.gif"),
                  image: NetworkImage(MockData.products[index].photo),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
