import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:smartwastefrontend/registration.dart';

class ViewProduct extends StatefulWidget {
  const ViewProduct({super.key});

  @override
  State<ViewProduct> createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {
  final Dio dio = Dio();
  bool loading = true;
  List products = [];

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      final response = await dio.get('$baseurl/products');
      setState(() {
        products = response.data;
        loading = false;
      });
    } catch (e) {
      print('API Error: $e');
      setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reward Points'),
        backgroundColor: const Color(0xFF388E3C),
        centerTitle: true,
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final item = products[index];
                final imageUrl = '$baseurl${item['Image']}' ?? '';
                final name = item['ProductName'] ?? '';
                final point = item['Point'] ?? '';
                final desc = item['Description'] ?? '';

                return Card(
                  child: ListTile(
                    leading: Image.network(
                      imageUrl,
                      width: 50,
                      height: 50,
                      errorBuilder: (_, __, ___) => const Icon(Icons.image),
                    ),
                    title: Text(name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Points: $point'),
                        Text(desc),
                      ],
                    ),
                    trailing: TextButton(
                      onPressed: () {},
                      child: const Text('Buy Now'),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
