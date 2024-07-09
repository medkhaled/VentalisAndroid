import 'package:flutter/material.dart';

class Orders extends StatelessWidget {
  final List<dynamic> orders;

  Orders({required this.orders});

  @override
  Widget build(BuildContext context) {
    if (orders.isEmpty) return Center(child: Text('Pas de commandes trouvées.'));

    return ListView(
      padding: EdgeInsets.all(16.0),
      children: orders.map((order) {
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('ID Commande: ${order['orderCode']}', style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('Statut: ${order['status']}'),
          ),
        );
      }).toList(),
    );
  }
}
