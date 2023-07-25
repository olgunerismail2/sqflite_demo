import 'package:flutter/material.dart';

import '../data/dbHelper.dart';
import '../models/product.dart';

class ProductAdd extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ProductAddState();
  }

}

class ProductAddState extends State {
  var dbHelper =DbHelper();
  var txtName = TextEditingController();
  var txtDescription = TextEditingController();
  var txtUnitPriceField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Ürün Ekle"),
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            buildNameField(), buildDescriptionField(), buildUnitPriceField(),buildSaveButton()
          ],
        ),
      ),
    );
  }

  buildNameField() {
    return TextField(
      decoration: InputDecoration(labelText: "Ürünün Adı"),
      controller: txtName,

    );
  }

  buildDescriptionField() {
    return TextField(
      decoration: InputDecoration(labelText: "Ürün Açıklaması"),
      controller: txtDescription,
    );
  }

  buildUnitPriceField() {
    return TextField(
      decoration: InputDecoration(labelText: "Birim Fiyatı"),
      controller: txtUnitPriceField,
    );
  }

  buildSaveButton() {
    return TextButton(
      child: Text("Ekle"),
      onPressed:() {
        addProduct();
      },
    );

  }

  void addProduct() async {
  var result= await dbHelper.insert(Product(txtName.text, txtDescription.text,
      txtUnitPriceField.text as double), description: '');
Navigator.pop(context,true);
  }

}