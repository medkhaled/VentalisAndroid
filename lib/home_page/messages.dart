import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  final List<dynamic> messages;
  final Map<String, dynamic> userData;

  Messages({required this.messages, required this.userData});

  @override
  Widget build(BuildContext context) {
    if (messages.isEmpty) return Center(child: Text('Pas de messages trouvés.'));

    return ListView(
      padding: EdgeInsets.all(16.0),
      children: messages.map((message) {
        return Align(
          alignment: message['sender'] == userData['id']
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: Card(
            color: message['sender'] == userData['id']
                ? Colors.blue[100]
                : Colors.grey[200],
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListTile(
              title: Text(
                'Date: ${message['date']}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(message['content']),
            ),
          ),
        );
      }).toList(),
    );
  }
}
