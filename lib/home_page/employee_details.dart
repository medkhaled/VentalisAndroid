import 'package:flutter/material.dart';

class EmployeeDetails extends StatelessWidget {
  final Map<String, dynamic> employeeData;

  EmployeeDetails({required this.employeeData});

  @override
  Widget build(BuildContext context) {
    if (employeeData.isEmpty) return Center(child: Text('Pas de données d\'employé.'));

    return ListView(
      padding: EdgeInsets.all(16.0),
      children: employeeData.entries.map((entry) {
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            leading: Icon(Icons.work),
            title: Text('${entry.key}', style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('${entry.value}'),
          ),
        );
      }).toList(),
    );
  }
}
