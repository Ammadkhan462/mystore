import 'package:flutter/material.dart';
import 'package:mystore/models/product.dart';
import 'package:mystore/screens/product_detail_screen.dart';
import 'package:provider/provider.dart';

class Productitem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageurl;
  // Productitem(this.id, this.title, this.imageurl);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context,
        listen:
            false); // listen: false); listen will help notto change the data
    print('object');
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed(ProductDetail.routeName, arguments: product.id);
        },
        child: Card(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(
                    8.0), // You can adjust the value as per your preference
                child: Align(
                  alignment: Alignment
                      .topCenter, // You can adjust the alignment as per your preference
                  child: Image.network(
                    product.imageUrl,
                    width: 210, // specify the width you want for the image
                    height: 150, // specify the height you want for the image
                    fit: BoxFit
                        .cover, // or any other BoxFit option based on your preference
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      '${product.title}',
                      style: TextStyle(
                        fontSize: product.title.length > 7 ? 25 : 30,
                      ),
                    )),
                    SizedBox(
                      width: 2,
                    ),
                    GestureDetector(
                      onTap: () {
                        product.toggleFavouritestatus();
                      },
                      child: Consumer<Product>(
                        builder: (ctx, product, child) => Icon(
                          product.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Icon(Icons.shop_2_outlined)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
