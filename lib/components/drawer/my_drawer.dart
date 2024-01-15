import 'package:flutter/material.dart';
import 'package:israelmerlyn_ecommerce/components/title/my_ttitle.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              //drawer header: logo
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.shopping_bag,
                    size: 70,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              //shop title
              MyTitle(
                  text: "Shop",
                  icon: Icons.home,
                  onTap: () => Navigator.pop(context)),
              //cart title
              MyTitle(
                text: "cart",
                icon: Icons.shopping_cart,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/cart_pages');
                },
              ),
              MyTitle(
                  text: "settings",
                  icon: Icons.settings,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/setting_pages');
                  }),
            ],
          ),
          //exit shop title
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyTitle(
              text: "exit",
              icon: Icons.exit_to_app,
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                  context, '/intro_pages', (route) => false),
            ),
          ),
        ],
      ),
    );
  }
}
