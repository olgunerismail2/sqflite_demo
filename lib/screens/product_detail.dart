import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite_demo/data/dbHelper.dart';

import '../models/product.dart';

class ProductDetail extends StatefulWidget{
  Product product;
  ProductDetail(this.product);
  var dbHelper= DbHelper();

  @override
  State<StatefulWidget> createState() {
 return ProductDetailState (product);
  }

}
enum Options{delete,update}
class ProductDetailState extends State{
  Product product;
  ProductDetailState(this.product);

  get dbHelper => null;

  get options => null;

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("Ürün Detayı : ${product.name}"),
       actions: <Widget>[
         PopupMenuButton<Options>(
           onSelected: selectProcess,
           itemBuilder: (BuildContext context)=><PopupMenuEntry<Options>>[
             PopupMenuItem<Options>(
               value: Options.delete,
               child: Text("Sil"),
             ),
             PopupMenuItem<Options>(
               value: Options.update,
               child: Text("Güncelle"),
             ),
           ],

         )
       ],
     ),
     body: buildProductDetail(),

   );
  }

  buildProductDetail() {}

  void selectProcess(Options value) async{
   switch(options){
     case Options.delete:

       await dbHelper.delete(product.id);
       Navigator.pop(context as BuildContext ,true);
       break;
     default:
   }

  }
}