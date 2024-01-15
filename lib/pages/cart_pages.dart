// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:israelmerlyn_ecommerce/components/button/my_button.dart';
import 'package:israelmerlyn_ecommerce/models/product.dart';
import 'package:israelmerlyn_ecommerce/models/shop.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';

class CartPages extends StatelessWidget {
  const CartPages({super.key});

//metodo para remover producto del carrito de compra
  void removeItemFromCart(BuildContext context, Product product) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: const Text('Deseas eliminar del carrito?'),
              actions: [
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('cancelar'),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                    context.read<Shop>().removeItemCart(product);
                  },
                  child: const Text('si'),
                )
              ],
            ));
  }

  void removeItemFromCartAlert(BuildContext context, Product product) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.confirm,
      title: 'Deseas eliminar el producto ?',
      confirmBtnText: 'si',
      cancelBtnText: 'no',
      onConfirmBtnTap: () {
        Navigator.pop(context);
        context.read<Shop>().removeItemCart(product);
      },
    );
  }

  void payButtonPressd(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              content: Text('Error de conexion con el backend'),
              title: Text('Error al pagar'),
            ));
  }

  void payButtonAlert(BuildContext context) {
    QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: 'Error al Pagar',
        text: 'Error de conexion con la BD backend',
        confirmBtnText: 'ok');
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Carrito de compras'),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          //cart list
          Expanded(
            child: cart.isEmpty
                ? Center(child: Text('Tu carrito esta vacio ...'))
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final item = cart[index];

                      //return as a cart tile UI

                      return Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: EdgeInsets.only(
                          left: 20,
                          top: 20,
                          right: 20,
                        ),
                        child: ListTile(
                          title: Text(
                            item.name,
                          ),
                          subtitle: Text(item.price.toStringAsFixed(2)),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () =>
                                removeItemFromCartAlert(context, item),
                          ),
                        ),
                      );
                    },
                  ),
          ),
          //boton de pagar

          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(
              child: Text('pagar'),
              onTap: () => payButtonAlert(context),
            ),
          )
        ],
      ),
    );
  }
}
