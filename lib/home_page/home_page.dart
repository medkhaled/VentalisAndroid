import 'package:flutter/material.dart';
import 'user_details.dart';
import 'employee_details.dart';
import 'messages.dart';
import 'orders.dart';

class HomePage extends StatefulWidget {
  final Map<String, dynamic> userData;
  final Map<String, dynamic> employeeData;
  final List<dynamic> orders;
  final List<dynamic> messages;

  HomePage({
    required this.userData,
    required this.employeeData,
    required this.orders,
    required this.messages,
  });

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildContent() {
    switch (_selectedIndex) {
      case 0:
        return UserDetails(userData: widget.userData);
      case 1:
        return EmployeeDetails(employeeData: widget.employeeData);
      case 2:
        return Messages(messages: widget.messages, userData: widget.userData);
      case 3:
        return Orders(orders: widget.orders);
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accueil'),
      ),
      body: _buildContent(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Moi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Employée',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Commandes',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
