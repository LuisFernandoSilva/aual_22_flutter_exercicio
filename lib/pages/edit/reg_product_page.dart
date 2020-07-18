import 'dart:io';

import 'package:aula_22_flutter_exercicio/data/mock_data.dart';
import 'package:aula_22_flutter_exercicio/models/product.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class RegProductPage extends StatefulWidget {
  static String routeName = '/reg_products';
  @override
  _RegProductPageState createState() => _RegProductPageState();
}

class _RegProductPageState extends State<RegProductPage> {
  Product _product;
  final _imagePicker = ImagePicker();
  File _image;
  final _nameController = TextEditingController();
  final _descrController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _product = ModalRoute.of(context).settings.arguments;
    _nameController.text = '${_product?.name ?? ''}';
    _descrController.text = '${_product?.description ?? ''}';
  }

  @override
  void initState() {
    super.initState();
  }

  Future<void> _photo(ImageSource source) async {
    var _pickedFile = await _imagePicker.getImage(
      source: source,
      imageQuality: 70,
      maxWidth: 1024,
    );
    if (_pickedFile != null) {
      setState(() {
        _image = File(_pickedFile.path);
      });
    }
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
        child: Column(
          //mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    _image == null
                        ? Container(
                            height: 200,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                            ),
                            child: AspectRatio(
                              aspectRatio: 16 / 9,
                              child: FadeInImage(
                                placeholder: AssetImage('assets/warning.png'),
                                image: NetworkImage(_product?.photo ?? ''),
                              ),
                            ),
                          )
                        : AspectRatio(
                            aspectRatio: 16 / 9,
                            child: FadeInImage(
                              placeholder: AssetImage('assets/loading.gif'),
                              image: FileImage(_image),
                            ),
                          ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton.icon(
                          onPressed: () {
                            _photo(ImageSource.camera);
                          },
                          icon: Icon(Icons.photo_camera),
                          label: Text('Tirar'),
                        ),
                        SizedBox(width: 8),
                        RaisedButton.icon(
                          onPressed: () {
                            _photo(ImageSource.gallery);
                          },
                          icon: Icon(Icons.photo_library),
                          label: Text('Galeria'),
                        ),
                      ],
                    ),
                    Divider(),
                    TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        hintText: 'Nome',
                        border: OutlineInputBorder(),
                      ),
                      onSubmitted: (value) {
                        _product.name = value;
                      },
                    ),
                    SizedBox(height: 8),
                    TextField(
                      controller: _descrController,
                      decoration: InputDecoration(
                          hintText: 'Descrição', border: OutlineInputBorder()),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      onSubmitted: (value) {
                        _product.description = value;
                      },
                    )
                  ],
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 40,
                  child: OutlineButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancelar'),
                    borderSide: BorderSide(color: Colors.blue),
                    focusColor: Colors.red,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  flex: 60,
                  child: OutlineButton(
                    child: Text('Salvar'),
                    onPressed: () {
                      MockData.products.add(_product);
                      Navigator.of(context).pop();
                    },
                    borderSide: BorderSide(color: Colors.blue),
                    focusColor: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
