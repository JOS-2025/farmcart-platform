import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/// CHANGE THIS BASE URL LATER IF NEEDED
/// If testing on emulator:
///   http://10.0.2.2:8000/api
/// If testing on real phone:
///   http://YOUR_PC_IP:8000/api
const String baseUrl = 'http://10.0.2.2:8000/api';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  late Future<List<dynamic>> _productsFuture;

  @override
  void initState() {
    super.initState();
    _productsFuture = fetchProducts();
  }

  Future<List<dynamic>> fetchProducts() async {
    final response = await http.get(
      Uri.parse('$baseUrl/products/'),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load products');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _productsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          final products = snapshot.data!;

          if (products.isEmpty) {
            return const Center(child: Text('No products found'));
          }

          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  leading: product['image'] != null
                      ? Image.network(
                          product['image'],
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        )
                      : const Icon(Icons.shopping_bag),
                  title: Text(product['name'] ?? 'Unnamed'),
                  subtitle: Text(
                    'KES ${product['price_per_kg']} / kg',
                  ),
                  trailing: Text(
                    '${product['stock_kg']} kg',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

