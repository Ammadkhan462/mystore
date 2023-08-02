import 'package:flutter/material.dart';
import 'package:mystore/provider/product_provider.dart';
import 'package:mystore/screens/product_detail_screen.dart';
import 'package:mystore/screens/product_overview_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Name());
}

class Name extends StatelessWidget {
  const Name({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) {
        return Products();
      },
      // value: Products(),

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Myshop',
        home: Productoverviewscreen(),
        routes: {
          ProductDetail.routeName: (ctx) => ProductDetail(),
        },
      ),
    );
  }
}
