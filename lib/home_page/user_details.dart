import 'package:flutter/material.dart';

class UserDetails extends StatelessWidget {
  final Map<String, dynamic> userData;

  UserDetails({required this.userData});

  @override
  Widget build(BuildContext context) {
    if (userData.isEmpty) return Center(child: Text('Pas de données utilisateur.'));
    var filteredUserData = Map<String, dynamic>.from(userData)..remove('id');

    return ListView(
      padding: EdgeInsets.all(16.0),
      children: filteredUserData.entries.map((entry) {
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            title: Text('${entry.key}', style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('${entry.value}'),
          ),
        );
      }).toList(),
    );
  }
}
