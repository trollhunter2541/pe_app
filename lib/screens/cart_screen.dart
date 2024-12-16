import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Product {
  final String id;
  final String productName;
  final double price;
  int quantity;

  Product({
    required this.id,
    required this.productName,
    required this.price,
    this.quantity = 1, // Default quantity to 1
  });

  double get totalPrice => price * quantity;
}

class CartScreen extends StatefulWidget {
  final String cartId;

  const CartScreen({super.key, required this.cartId});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // late final _cartRef = FirebaseDatabase.instance.ref().child('panier');
  List<Product> products = [
    Product(id: '1', productName: 'Apple', price: 1.0, quantity: 3),
    Product(id: '2', productName: 'Banana', price: 0.5, quantity: 5),
    Product(id: '3', productName: 'Orange', price: 1.2, quantity: 2),
    Product(id: '4', productName: 'Mango', price: 2.0, quantity: 4),
    Product(id: '5', productName: 'Pineapple', price: 3.0, quantity: 1),
    Product(id: '6', productName: 'Grapes', price: 2.5, quantity: 3),
    Product(id: '7', productName: 'Blueberry', price: 5.0, quantity: 1),
    Product(id: '8', productName: 'Strawberry', price: 4.0, quantity: 6),
    Product(id: '9', productName: 'Watermelon', price: 6.0, quantity: 2),
    Product(id: '10', productName: 'Peach', price: 2.2, quantity: 7),
    Product(id: '11', productName: 'Plum', price: 1.8, quantity: 3),
    Product(id: '12', productName: 'Cherry', price: 4.5, quantity: 5),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Panier'), // Cart title
      ),
      body: _buildContent(products),
      // body: StreamBuilder<DatabaseEvent>(
      //   stream: _itemsStream, // Stream from Firebase
      //   builder: (context, snapshot) {
      //     print("Hello....");
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return Center(
      //           child: CircularProgressIndicator()); // Show loading indicator
      //     }

      //     if (snapshot.hasError) {
      //       return Center(
      //           child: Text('Error: ${snapshot.error}')); // Handle errors
      //     }

      //     if (!snapshot.hasData || snapshot.data!.snapshot.value == null) {
      //       return Center(
      //           child: Text('No products in the cart')); // Handle no data
      //     }

      //     // Extract the data from the snapshot
      //     final data = snapshot.data!.snapshot.value as Map?;
      //     if (data == null) {
      //       return Center(child: Text('No products available'));
      //     }

      //     // Convert the data into a list of Product objects
      //     List<Product> cartItems = [];
      //     data.forEach((key, value) {
      //       final product = Product(
      //         id: key,
      //         productName: value['productName'],
      //         price: value['price'],
      //         quantity: value['quantity'],
      //       );
      //       cartItems.add(product);
      //     });

      //     return _buildContent(cartItems);
      //   },
      // ),

      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Text(
            //   'Total: ',
            //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            // ),
            ElevatedButton(
              onPressed: () {
                // Add action for checkout or clearing cart
              },
              child: Text('Checkout'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(List<Product> cartItems) {
    return ListView.builder(
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        final product = cartItems[index];
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text(product.productName),
            subtitle: Text('${product.quantity}x${product.price}DH'),
          ),
        );
      },
    );
  }
}
