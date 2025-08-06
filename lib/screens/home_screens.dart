import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth_service.dart';
import '../models/user.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthService>(context);
    final user = auth.appUser;

    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenue, ${user?.prenom ?? ''}'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await auth.signOut();
            },
          )
        ],
      ),
      body: Center(
        child: Text('Page principale des employés'),
      ),
    );
  }
}