import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/product_provider.dart';

class ProductDetail extends StatelessWidget {
  static const routeName = '/product-detail';
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final productid = ModalRoute.of(context)?.settings.arguments as String;
    final loadedproduct = Provider.of<Products>(context).findbyid(productid);

    return Scaffold(
      appBar: AppBar(
        title: Text(loadedproduct.id),
      ),
    );
  }
}
