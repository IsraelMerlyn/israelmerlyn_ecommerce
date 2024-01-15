import 'package:flutter/material.dart';
import 'package:israelmerlyn_ecommerce/components/button/my_button.dart';

class IntroPages extends StatelessWidget {
  const IntroPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.shopping_bag,
              size: 72,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(
              height: 25,
            ),
            // title

            const Text(
              'IsraMerlyn SHOP',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),

            const SizedBox(
              height: 25,
            ),
            //subtitle
            Text(
              'CELULARES ANDROID / IOS',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
            const SizedBox(
              height: 25,
            ),
            //button

            MyButton(
                onTap: () => Navigator.pushNamed(context, '/shop_pages'),
                child: const Icon(Icons.arrow_forward))
          ],
        ),
      ),
    );
  }
}
