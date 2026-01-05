import 'package:flutter/material.dart';
import 'product_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Farmer Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Welcome to FarmCart',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),

            Text('• View your products'),
            Text('• Receive AI farming advice'),
            Text('• Accept Mpesa payments'),

            SizedBox(height: 30),

            _ViewProductsButton(),
          ],
        ),
      ),
    );
  }
}

class _ViewProductsButton extends StatelessWidget {
  const _ViewProductsButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const ProductListScreen(),
          ),
        );
      },
      child: const Text('View Products'),
    );
  }
}

