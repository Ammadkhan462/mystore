import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../widgets/productgrid.dart';
import '../provider/product_provider.dart';

enum Filteroption {
  Favourite,
  ALL,
}

class Productoverviewscreen extends StatefulWidget {
  const Productoverviewscreen({Key? key}) : super(key: key);

  @override
  State<Productoverviewscreen> createState() => _ProductoverviewscreenState();
}

class _ProductoverviewscreenState extends State<Productoverviewscreen> {
  var _showonlyfavourite = false;
  @override
  Widget build(BuildContext context) {
    // final productcontainer = Provider.of<Products>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Myshop'),
        actions: [
          PopupMenuButton(
              onSelected: (Filteroption selected) {
                setState(() {
                  if (selected == Filteroption.Favourite) {
                    //productcontainer.showFavouriteonly();
                    _showonlyfavourite = true;
                  } else {
                    _showonlyfavourite = false;
                    // productcontainer.showall();
                  }
                });

                print(selected);
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) => [
                    PopupMenuItem(
                      child: Text('only Favourite'),
                      value: Filteroption.Favourite,
                    ),
                    PopupMenuItem(
                      child: Text('show all'),
                      value: Filteroption.ALL,
                    )
                  ])
        ],
      ),
      body: ProductDT(_showonlyfavourite),
    );
  }
}
