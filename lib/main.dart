// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:israelmerlyn_ecommerce/models/shop.dart';
import 'package:israelmerlyn_ecommerce/pages/cart_pages.dart';
import 'package:israelmerlyn_ecommerce/pages/details_product_pages.dart';
import 'package:israelmerlyn_ecommerce/pages/intro_pages.dart';
import 'package:israelmerlyn_ecommerce/pages/setting_pages.dart';
import 'package:israelmerlyn_ecommerce/pages/shop_pages.dart';
import 'package:israelmerlyn_ecommerce/theme/light_mode.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Shop(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //     // primarySwatch: Colors.blue,
      //     // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //     // useMaterial3: true,
      //     ),
      theme: lightMode,
      home: IntroPages(),
      routes: {
        '/intro_pages': (context) => const IntroPages(),
        '/shop_pages': (context) => const ShopPages(),
        '/cart_pages': (context) => const CartPages(),
        '/setting_pages': (context) => const SettingPages(),
        '/details_pages': (context) => const DetailsProduct(),
      },
    );
  }
}
