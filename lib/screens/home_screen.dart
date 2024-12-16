import 'package:flutter/material.dart';
import 'package:pe_cart/screens/cart_screen.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey qrKey = GlobalKey();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Navigate to QR Scanner
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CartScreen(cartId: "panier"),
              ),
            );
          },
          child: Text('Scan Cart QR'),
        ),
      ),
    );
  }
}
