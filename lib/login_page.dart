import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'home_page/home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  Map<String, dynamic> _userData = {};
  Map<String, dynamic> _employeeData = {};
  List<dynamic> _orders = [];
  List<dynamic> _messages = [];
  String _errorMessage = '';

  Future<void> _login() async {
    final url = Uri.parse('https://127.0.0.1:8000/api/login');
    final response = await http.post(
      url,
      body: json.encode({
        "username": _usernameController.text,
        "password": _passwordController.text,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      setState(() {
        _userData = responseData['user'] ?? {};
        _employeeData = responseData['employee'] ?? {};
        _orders = responseData['orders'] ?? [];
        _messages = responseData['messages'] ?? [];
        _errorMessage = '';
      });

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(
            userData: _userData,
            employeeData: _employeeData,
            orders: _orders,
            messages: _messages,
          ),
        ),
      );
    } else {
      setState(() {
        _errorMessage = 'Failed to log in: ${response.reasonPhrase}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Mot de passe'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('Connecter'),
            ),
            SizedBox(height: 20),
            _errorMessage.isNotEmpty
                ? Text(
              _errorMessage,
              style: TextStyle(color: Colors.red),
            )
                : Container(),
          ],
        ),
      ),
    );
  }
}
