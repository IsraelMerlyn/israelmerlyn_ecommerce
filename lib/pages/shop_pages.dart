// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:israelmerlyn_ecommerce/components/drawer/my_drawer.dart';
import 'package:israelmerlyn_ecommerce/components/product/my_product.dart';

import 'package:israelmerlyn_ecommerce/models/shop.dart';
import 'package:provider/provider.dart';

class ShopPages extends StatefulWidget {
  const ShopPages({super.key});

  @override
  State<ShopPages> createState() => _ShopPagesState();
}

class _ShopPagesState extends State<ShopPages> {
  @override
  Widget build(BuildContext context) {
    //acceso a productos en la tienda

    final products = context.watch<Shop>().shop;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Shop'),
        actions: [
          IconButton(
              onPressed: () => Navigator.pushNamed(context, '/cart_pages'),
              icon: Icon(Icons.shopping_cart))
        ],
      ),
      drawer: MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        children: [
          const SizedBox(
            height: 25,
          ),
          //shop subtitle
          Center(
              child: Text(
            'Productos iphone de calidad premium',
            style:
                TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
          )),
          //shop list
          SizedBox(
            height: 550,
            child: ListView.builder(
              itemCount: products.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(15),
              itemBuilder: (context, index) {
                //get each individual product from shop

                final product = products[index];

                //return as a product tile UI
                return MyProductTile(product: product);
              },
            ),
          ),
          card_products(),
          card_products(),
          card_products(),
        ],
      ),
    );
  }

  Widget card_products() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // Image.asset(
              //   'assets/sushi3.png',
              //   height: 60,
              // ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pixel 7 PRO",
                    // style: GoogleFonts.dmSerifDisplay(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "\$12,000.00",
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Icon(
            Icons.favorite_outline,
            color: const Color.fromARGB(255, 254, 1, 1),
            size: 28,
          )
        ],
      ),
    );
  }
}
