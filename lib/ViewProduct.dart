import 'package:flutter/material.dart';

class ViewProduct extends StatefulWidget {
  const ViewProduct({super.key});

  @override
  State<ViewProduct> createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Reward Points',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF388E3C), // deep green
        centerTitle: true,
        elevation: 4,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(leading: Icon(Icons.production_quantity_limits),title: Text('lays'),),
          );
        },
      ),
    );
  }
}
