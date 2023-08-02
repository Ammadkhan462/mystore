import 'package:flutter/material.dart';
import 'package:mystore/widgets/product_item.dart';
import '../provider/product_provider.dart';

import 'package:provider/provider.dart';

class ProductDT extends StatelessWidget {
  final bool showfav;
  ProductDT(this.showfav);
  @override
  Widget build(BuildContext context) {
    final productdata = Provider.of<Products>(context);
    final products = showfav ? productdata.favouriteitems : productdata.items;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10), //how the grid is structured

      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          // create: (c) => products[i],
          value: products[i],
          child: Productitem(
              //products[i].id, products[i].title, products[i].imageUrl
              )),
      itemCount: products.length,
      padding: const EdgeInsets.all(10),
    );
  }
}
